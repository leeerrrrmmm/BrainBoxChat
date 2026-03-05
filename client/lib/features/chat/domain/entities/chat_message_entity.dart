/// Message entity for the chat entity
class ChatMessageEntity {
  /// Message id
  final String id;

  /// Message content
  final String content;

  /// Message role
  final ChatMessageEntityRole role;

  /// Message created at
  final DateTime createdAt;

  /// Model that produced this message (e.g. gemini-1.5-flash). Null for user messages. /
  final String? modelId;

  /// Constructor for the Message entity
  const ChatMessageEntity({
    required this.id,
    required this.content,
    required this.role,
    required this.createdAt,
    this.modelId,
  });
}

/// Message role enum for the chat entity
enum ChatMessageEntityRole {
  /// User role
  user,

  /// Assistant role
  assistant,

  /// System role
  system,
}
