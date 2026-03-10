import 'package:client/features/history/domain/entity/chat_session_entity.dart';

/// History repository for the history feature
abstract class HistoryRepository {
  /// Get all chat sessions
  Future<List<ChatSessionEntity>> getChatSessions();

  /// Delete a chat session
  Future<void> deleteChatSession(String sessionId);
}
