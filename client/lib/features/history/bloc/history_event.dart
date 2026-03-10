/// History event for the history feature
abstract class HistoryEvent {}

/// Load history event for the history feature

class LoadHistoryEvent extends HistoryEvent {}

/// Delete session event for the history feature
class DeleteSessionEvent extends HistoryEvent {
  /// Session id
  final String sessionId;

  /// Constructor for the DeleteSessionEvent
  DeleteSessionEvent(this.sessionId);
}
