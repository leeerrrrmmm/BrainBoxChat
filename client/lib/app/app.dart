import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:client/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:client/shared/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Корневой виджет приложения.
/// Здесь создаётся ChatBloc и пробрасывается вниз по дереву.
class App extends StatelessWidget {
  /// Use case для отправки сообщений в чат
  final SendMessageUseCase useCase;

  /// Конструктор приложения
  const App({required this.useCase, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(useCase),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigation(),
      ),
    );
  }
}
