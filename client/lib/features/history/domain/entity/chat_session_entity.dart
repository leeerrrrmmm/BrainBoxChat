/// Chat session entity for the history feature
class ChatSessionEntity {
  /// Chat session id
  final String id;

  /// Chat session service
  final String service;

  /// Chat session preview
  final String preview;

  /// Chat session last message at
  final DateTime lastMessageAt;

  /// Constructor for the ChatSessionEntity
  const ChatSessionEntity({
    required this.id,
    required this.service,
    required this.preview,
    required this.lastMessageAt,
  });
}
