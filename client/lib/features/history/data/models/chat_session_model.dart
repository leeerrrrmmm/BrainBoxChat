import 'package:client/features/history/domain/entity/chat_session_entity.dart';

/// Chat session model for API mapping.
class ChatSessionModel extends ChatSessionEntity {
  /// Constructor for the ChatSessionModel
  const ChatSessionModel({
    required super.id,
    required super.service,
    required super.preview,
    required super.lastMessageAt,
  });

  /// FromJson: API returns `lastMessageAt` as string or int
  factory ChatSessionModel.fromJson(Map<String, dynamic> json) {
    final lastMessageAt = json['lastMessageAt'];

    return ChatSessionModel(
      id: json['id'] as String,
      service: json['service'] as String? ?? '',
      preview: json['preview'] as String? ?? '',
      lastMessageAt: lastMessageAt is String
          ? DateTime.tryParse(lastMessageAt) ?? DateTime.now()
          : (lastMessageAt is int
                ? DateTime.fromMillisecondsSinceEpoch(lastMessageAt)
                : DateTime.now()),
    );
  }
}
