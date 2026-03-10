import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:uuid/uuid.dart';

/// Message model for the chat entity
class ChatMessageModel extends ChatMessageEntity {
  /// Constructor for the ChatMessageModel
  const ChatMessageModel({
    required super.id,
    required super.content,
    required super.role,
    required super.createdAt,
    super.modelId,
    super.sessionId,
  });

  /// FromJson: backend returns `reply`, optional `model`, optional `sessionId`.
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    final modelId = json['model'] as String?;
    final sessionId = json['sessionId'] as String?;

    return ChatMessageModel(
      id: const Uuid().v4(),
      content: json['reply'] as String? ?? '',
      role: ChatMessageEntityRole.assistant,
      createdAt: DateTime.now(),
      modelId: modelId,
      sessionId: sessionId,
    );
  }
}
