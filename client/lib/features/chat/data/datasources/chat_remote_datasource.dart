/// Chat remote data source for the chat feature
abstract class ChatRemoteDataSource {
  /// Send a message to the chat
  Future<Map<String, dynamic>> sendMessage(String message);
}
