/// Chat remote data source for the chat feature
abstract class ChatRemoteDataSource {
  /// Send a message to the chat.
  /// [service] and [sessionId] are sent so the server can create/update history sessions.
  Future<Map<String, dynamic>> sendMessage(
    String message, {
    String? service,
    String? sessionId,
  });
}
