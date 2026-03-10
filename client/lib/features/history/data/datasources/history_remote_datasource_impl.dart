import 'package:client/core/constants/app_constants.dart';
import 'package:client/features/history/data/datasources/history_remote_datasource.dart';
import 'package:dio/dio.dart';

const int _statusNotFound = 404;

/// Remote implementation of history data source.
class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final Dio dio;

  HistoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Map<String, dynamic>>> getChatSessions() async {
    try {
      final response = await dio.get<List<dynamic>>(
        '${AppConstants.apiBaseUrl}/chat/sessions',
      );
      final list = response.data;
      if (list == null) {
        return [];
      }

      return list.map((e) => e as Map<String, dynamic>).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == _statusNotFound) {
        return [];
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteChatSession(String sessionId) async {
    try {
      await dio.delete(
        '${AppConstants.apiBaseUrl}/chat/sessions/$sessionId',
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == _statusNotFound) {
        return;
      }
      rethrow;
    }
  }
}
