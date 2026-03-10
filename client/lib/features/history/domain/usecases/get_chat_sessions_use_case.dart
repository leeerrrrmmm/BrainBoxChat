import 'package:client/features/history/domain/entity/chat_session_entity.dart';
import 'package:client/features/history/domain/repository/history_repository.dart';

/// Get chat sessions use case for the history feature
class GetChatSessionsUseCase {
  /// Repository for the history feature
  final HistoryRepository repository;

  /// Constructor for the GetChatSessionsUseCase
  GetChatSessionsUseCase(this.repository);

  /// Call the get chat sessions use case
  Future<List<ChatSessionEntity>> call() async {
    return repository.getChatSessions();
  }
}
