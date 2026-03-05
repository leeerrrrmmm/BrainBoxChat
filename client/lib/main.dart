import 'dart:developer';

import 'package:client/app/app.dart';
import 'package:client/features/chat/data/datasources/chat_remote_datasource_impl.dart';
import 'package:client/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
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

  final remoteDataSource = ChatRemoteDataSourceImpl(dio);
  final repository = ChatRepositoryImpl(remoteDataSource);
  final useCase = SendMessageUseCase(repository);

  runApp(App(useCase: useCase));
}
