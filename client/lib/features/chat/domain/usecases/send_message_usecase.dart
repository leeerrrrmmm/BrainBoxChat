import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:client/features/chat/domain/repositories/chat_repository.dart';

/// Send message use case for the chat feature
class SendMessageUseCase {
  /// Repository for the chat feature
  final ChatRepository repository;

  /// Constructor for the SendMessageUseCase
  SendMessageUseCase(this.repository);

  /// Call the send message use case
  Future<ChatMessageEntity> call(String message) {
    return repository.sendMessage(message);
  }
}
