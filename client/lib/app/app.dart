import 'package:client/app/anim_cont.dart';
import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:client/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:client/features/history/bloc/history_bloc.dart';
import 'package:client/features/history/domain/usecases/delete_use_case.dart';
import 'package:client/features/history/domain/usecases/get_chat_sessions_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Корневой виджет приложения.
/// Здесь создаются все основные BLoC.

class App extends StatelessWidget {
  /// Use case для отправки сообщений в чат
  final SendMessageUseCase useCase;

  /// Use case для получения списка чатов
  final GetChatSessionsUseCase getChatSessionsUseCase;

  /// Use case для удаления чата
  final DeleteChatSessionUseCase deleteChatSessionUseCase;

  /// Конструктор приложения
  const App({
    required this.useCase,
    required this.getChatSessionsUseCase,
    required this.deleteChatSessionUseCase,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Chat BLoC
        BlocProvider(
          create: (_) => ChatBloc(useCase),
        ),

        /// History BLoC
        BlocProvider(
          create: (_) => HistoryBloc(
            getChatSessionsUseCase: getChatSessionsUseCase,
            deleteChatSessionUseCase: deleteChatSessionUseCase,
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimCont(),
      ),
    );
  }
}
