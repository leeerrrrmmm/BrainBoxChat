import 'package:client/features/chat/domain/entities/chat_message_entity.dart';

/// Chat repository for the chat feature
abstract class ChatRepository {
  /// Send a message to the chat
  Future<ChatMessageEntity> sendMessage(String message);
}
