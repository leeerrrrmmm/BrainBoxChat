import 'package:client/core/constants/app_constants.dart';
import 'package:client/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:dio/dio.dart';

/// Chat remote data source implementation for the chat feature
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  /// Dio instance for the chat remote data source implementation
  final Dio dio;

  /// Constructor for the ChatRemoteDataSourceImpl
  ChatRemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> sendMessage(String message) async {
    final response = await dio.post(
      '${AppConstants.apiBaseUrl}/chat',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: {'message': message},
    );

    return response.data as Map<String, dynamic>;
  }
}
