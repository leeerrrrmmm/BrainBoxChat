import 'dart:developer';

import 'package:client/app/app.dart';
import 'package:client/features/chat/data/datasources/chat_remote_datasource_impl.dart';
import 'package:client/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:client/features/history/data/datasources/history_remote_datasource_impl.dart';
import 'package:client/features/history/data/repositories/history_repository_impl.dart';
import 'package:client/features/history/domain/usecases/delete_use_case.dart';
import 'package:client/features/history/domain/usecases/get_chat_sessions_use_case.dart';
import 'package:client/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky).then((
    _,
  ) {
    log('System UI mode set');
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    log('Firebase initialized');
  });

  final dio = Dio();

  // Chat
  final chatRemoteDataSource = ChatRemoteDataSourceImpl(dio);
  final chatRepository = ChatRepositoryImpl(chatRemoteDataSource);
  final sendMessageUseCase = SendMessageUseCase(chatRepository);

  // History
  final historyRemoteDataSource = HistoryRemoteDataSourceImpl(dio);
  final historyRepository = HistoryRepositoryImpl(historyRemoteDataSource);
  final getChatSessionsUseCase = GetChatSessionsUseCase(historyRepository);
  final deleteChatSessionUseCase = DeleteChatSessionUseCase(historyRepository);

  runApp(App(
    useCase: sendMessageUseCase,
    getChatSessionsUseCase: getChatSessionsUseCase,
    deleteChatSessionUseCase: deleteChatSessionUseCase,
  ));
}
