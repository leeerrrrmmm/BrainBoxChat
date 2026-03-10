import 'package:client/features/history/domain/repository/history_repository.dart';

/// Delete chat session use case for the history feature
class DeleteChatSessionUseCase {
  /// Repository for the history feature
  final HistoryRepository repository;

  /// Constructor for the DeleteChatSessionUseCase
  DeleteChatSessionUseCase(this.repository);

  /// Call the delete chat session use case
  Future<void> call(String sessionId) async {
    await repository.deleteChatSession(sessionId);
  }
}
