# Brainbox

Hi everyone 👋

This is my **first fullstack project**: a backend (structure still a work in progress) and a mobile client in a single repo. The goal is to build an **AI chat app** from scratch and learn how the pieces fit together.

---

## Why this project?

I wanted to try implementing **chat with AI** end-to-end: handle chat logic and **model switching on the backend** (using Google Gemini models), connect it from the **client**, and see how it all works in one app.

So this is a learning project to get familiar with:

- **Backend**: REST API for chat (Express + Google GenAI), listing available models, and **automatic fallback** between several Gemini models when one fails (e.g. rate limits or temporary errors).
- **Client**: Flutter app with Bloc, Dio for HTTP, Firebase (Auth, Firestore), and a feature-based structure (chat, auth, onboarding, history, profile, etc.).

---

## Tech stack

| Layer | Technologies |
|-------|--------------|
| **Backend** | Node.js, Express, [@google/genai](https://www.npmjs.com/package/@google/genai) (Gemini), CORS, dotenv |
| **Client** | Flutter, Bloc, Dio, Firebase (Auth, Firestore) |

The server uses **Google Gemini** only (via `@google/genai`). Supported models in the fallback chain: `gemini-2.5-flash`, `gemini-1.5-flash`, `gemini-1.5-pro`, `gemini-2.0-flash-exp`. If one model returns a retryable error (e.g. 429, 503), the server tries the next model in the list.

The client is organized by **features** (chat, auth, onboarding, welcome, history, profile, services, home, splash) with a clean-architecture style: domain entities, data layer (datasources, repositories), and presentation (screens, widgets, Bloc).

---

## Repository structure

```
brainbox/
├── server/                    # Node.js API
│   ├── config/                # OpenAI/GenAI client, env
│   ├── services/              # (placeholder for future structure)
│   └── index.js               # Express app, chat + models routes
│
└── client/                    # Flutter app
    └── lib/
        ├── app/
        ├── core/              # Constants, API client, errors
        ├── features/          # Chat, auth, onboarding, history, profile, etc.
        │   ├── chat/          # domain, data, presentation (Bloc, widgets)
        │   ├── auth/
        │   └── ...
        └── shared/            # Navigation, common widgets
```

---

## API reference

Base URL: `http://localhost:2000` (default).

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/chat/models` | Returns the list of models and the current fallback index. Response: `{ models: string[], currentIndex: number }`. |
| `POST` | `/api/chat` | Send a message and get an AI reply. Body: `{ "message": string }`. Response: `{ "reply": string, "model": string }`. On failure after trying all models: `503` with `{ "error": "All models failed", "code": "MODELS_UNAVAILABLE" }`. |

Errors are returned as `503` with a `code` (e.g. `SERVER_ERROR`) so the client can handle them consistently.

---

## Environment variables

**Server** (`server/.env`):

| Variable | Required | Description |
|----------|----------|-------------|
| `GOOGLE_API_KEY` | Yes | API key from [Google AI Studio](https://aistudio.google.com/). Used by `@google/genai` for Gemini. |

Create a `.env` file in the `server/` directory and add your key. Without it, the server starts but chat requests will fail.

---

## How to run

### Backend

```bash
cd server
# Create .env and set GOOGLE_API_KEY (from Google AI Studio)
npm install
npm start
```

Server runs at **http://localhost:2000**.

### Client

```bash
cd client
flutter pub get
flutter run
```

Point the app at `http://localhost:2000` (or your machine’s IP if running on a device). Configure the base URL in the client’s API/config if needed.

---

## Architecture notes

- **Backend**: Single entry point (`index.js`) with routes for chat and models. Retryable errors (e.g. 429, 503, 403, 404) trigger a switch to the next model; after all models are tried, the API returns 503. Unhandled errors are also mapped to 503 so the client never sees raw 500s.
- **Client**: Feature-based modules; chat uses Bloc for state, repository/datasource for API calls. Ready to extend with history persistence (e.g. Firestore), model selector UI, and richer chat features.

---

## Roadmap

- Improve backend structure (e.g. separate routes, services, config).
- Add more chat capabilities and optional model selection in the UI.
- Gradually mature the project (tests, env validation, better error handling).

---

If you have suggestions or want to discuss something, feel free to reach out 🧠
