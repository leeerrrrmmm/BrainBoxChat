import 'package:client/features/chat/domain/entities/chat_message_entity.dart';

/// Chat repository for the chat feature
abstract class ChatRepository {
  /// Send a message to the chat.
  /// [service] and [sessionId] are used for history sessions on the server.
  Future<ChatMessageEntity> sendMessage(
    String message, {
    String? service,
    String? sessionId,
  });
}
