import 'package:client/features/history/domain/entity/chat_session_entity.dart';

/// History state for the history feature

class HistoryState {
  /// List of chat sessions
  final List<ChatSessionEntity> sessions;

  /// Is loading
  final bool isLoading;

  /// Error
  final String? error;

  /// Constructor for the HistoryState
  const HistoryState({
    required this.sessions,
    required this.isLoading,
    this.error,
  });

  /// Factory method for the HistoryState
  factory HistoryState.initial() {
    return const HistoryState(
      sessions: [],
      isLoading: false,
    );
  }

  /// Copy with method for the HistoryState
  HistoryState copyWith({
    List<ChatSessionEntity>? sessions,
    bool? isLoading,
    String? error,
  }) {
    return HistoryState(
      sessions: sessions ?? this.sessions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
