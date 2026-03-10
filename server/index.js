import cors from "cors";
import crypto from "crypto";
import express from "express";
import ai from "./config/open-ai.js";

const app = express();
app.use(cors());
app.use(express.json());

// Тільки Gemini: @google/genai підтримує лише ці моделі (без префікса google/)
const MODELS = [
  "gemini-2.5-flash",
  "gemini-1.5-flash",
  "gemini-1.5-pro",
  "gemini-2.0-flash-exp",
];

let currentModelIndex = 0;

/** In-memory store: sessionId -> { id, service, preview, lastMessageAt } */
const sessions = new Map();

function isRetryableError(error) {
  const status = error?.status ?? error?.code;
  if (status == null) return true;
  return [429, 503, 403, 404].includes(Number(status));
}

// Список моделей для fallback (клієнт може показати в UI)
app.get("/api/chat/models", (req, res) => {
  res.json({ models: MODELS, currentIndex: currentModelIndex });
});

// Список сессий для History (сортировка по lastMessageAt, новые сверху)
app.get("/api/chat/sessions", (req, res) => {
  const list = Array.from(sessions.values()).sort(
    (a, b) => new Date(b.lastMessageAt) - new Date(a.lastMessageAt)
  );
  res.json(list);
});

app.delete("/api/chat/sessions/:id", (req, res) => {
  sessions.delete(req.params.id);
  res.status(204).send();
});

app.post("/api/chat", async (req, res) => {
  try {
    const { message, sessionId: existingId, service: serviceName } = req.body ?? {};

    if (!message) {
      return res.status(400).json({ error: "Message is required" });
    }

    const now = new Date().toISOString();
    const preview = String(message).slice(0, 80);
    const service = serviceName || "Chat";

    let sessionId = existingId;
    if (sessionId && sessions.has(sessionId)) {
      const s = sessions.get(sessionId);
      s.preview = preview;
      s.lastMessageAt = now;
    } else {
      sessionId = crypto.randomUUID();
      sessions.set(sessionId, {
        id: sessionId,
        service,
        preview,
        lastMessageAt: now,
      });
    }

    let attempts = 0;
    const totalModels = MODELS.length;

    while (attempts < totalModels) {
      const model = MODELS[currentModelIndex];
      try {
        console.log(`Trying model: ${model}`);

        const response = await ai.models.generateContent({
          model,
          contents: message,
        });

        const replyText =
          (response && typeof response.text !== "undefined")
            ? response.text
            : "";
        console.log(`Model success: ${model}`);
        return res.json({ reply: String(replyText), model, sessionId });
      } catch (err) {
        const status = err?.status ?? err?.code;
        console.error(`Model failed: ${model}`, status, err?.message ?? err);
        if (isRetryableError(err)) {
          currentModelIndex = (currentModelIndex + 1) % totalModels;
        }
        attempts++;
      }
    }

    return res.status(503).json({
      error: "All models failed",
      code: "MODELS_UNAVAILABLE",
    });
  } catch (err) {
    console.error("Chat handler error:", err);
    return res.status(503).json({
      error: "Server temporarily unavailable",
      code: "SERVER_ERROR",
    });
  }
});

// Жодна необроблена помилка не має повертати 500 — тільки 503
app.use((err, req, res, next) => {
  console.error("Unhandled error:", err);
  if (!res.headersSent) {
    res.status(503).json({
      error: "Server temporarily unavailable",
      code: "SERVER_ERROR",
    });
  }
  next(err);
});

app.listen(2000, () => {
  if (!process.env.GOOGLE_API_KEY) {
    console.warn("WARNING: GOOGLE_API_KEY is not set in .env — chat will fail.");
  }
  console.log("Server running on http://localhost:2000");
});