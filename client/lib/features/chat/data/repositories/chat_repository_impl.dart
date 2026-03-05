import 'package:client/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:client/features/chat/data/models/chat_message_model.dart';
import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:client/features/chat/domain/repositories/chat_repository.dart';

/// Chat repository implementation for the chat feature
class ChatRepositoryImpl implements ChatRepository {
  /// Remote data source for the chat repository
  final ChatRemoteDataSource remoteDataSource;

  /// Constructor for the ChatRepositoryImpl

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChatMessageEntity> sendMessage(String message) async {
    final json = await remoteDataSource.sendMessage(message);

    return ChatMessageModel.fromJson(json);
  }
}
