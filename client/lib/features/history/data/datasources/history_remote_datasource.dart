/// Remote data source for history (chat sessions).
abstract class HistoryRemoteDataSource {
  /// Fetch all chat sessions.
  Future<List<Map<String, dynamic>>> getChatSessions();

  /// Delete a chat session by id.
  Future<void> deleteChatSession(String sessionId);
}
