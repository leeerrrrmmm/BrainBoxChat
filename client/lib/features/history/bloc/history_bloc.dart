import 'package:client/features/history/bloc/history_event.dart';
import 'package:client/features/history/bloc/history_state.dart';
import 'package:client/features/history/domain/usecases/delete_use_case.dart';
import 'package:client/features/history/domain/usecases/get_chat_sessions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// History bloc for the history feature
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  /// Get chat sessions use case for the history feature
  final GetChatSessionsUseCase getChatSessionsUseCase;

  /// Delete chat session use case for the history feature
  final DeleteChatSessionUseCase deleteChatSessionUseCase;

  /// Constructor for the HistoryBloc
  HistoryBloc({
    required this.getChatSessionsUseCase,
    required this.deleteChatSessionUseCase,
  }) : super(HistoryState.initial()) {
    on<LoadHistoryEvent>(_onLoadHistory);
    on<DeleteSessionEvent>(_onDeleteSession);
  }

  Future<void> _onLoadHistory(
    LoadHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final sessions = await getChatSessionsUseCase();

      emit(
        state.copyWith(
          sessions: sessions,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteSession(
    DeleteSessionEvent event,
    Emitter<HistoryState> emit,
  ) async {
    await deleteChatSessionUseCase(event.sessionId);

    final updatedSessions = state.sessions
        .where((e) => e.id != event.sessionId)
        .toList();

    emit(state.copyWith(sessions: updatedSessions));
  }
}
