import 'package:client/features/history/data/datasources/history_remote_datasource.dart';
import 'package:client/features/history/data/models/chat_session_model.dart';
import 'package:client/features/history/domain/entity/chat_session_entity.dart';
import 'package:client/features/history/domain/repository/history_repository.dart';

/// History repository implementation.
class HistoryRepositoryImpl implements HistoryRepository {
  /// Remote data source for the history repository
  final HistoryRemoteDataSource remoteDataSource;

  /// Constructor for the HistoryRepositoryImpl
  HistoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ChatSessionEntity>> getChatSessions() async {
    final list = await remoteDataSource.getChatSessions();

    return list.map(ChatSessionModel.fromJson).toList();
  }

  @override
  Future<void> deleteChatSession(String sessionId) async {
    await remoteDataSource.deleteChatSession(sessionId);
  }
}
