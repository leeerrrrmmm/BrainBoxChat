part of 'chat_bloc.dart';

@immutable
/// Event for the ChatBloc
abstract class ChatBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Send message event for the ChatBloc
class SendMessageEvent extends ChatBlocEvent {
  /// Message for the SendMessageEvent
  final String message;

  /// Service prompt for the SendMessageEvent
  final String? servicePrompt;

  /// Chat key (category/service name), e.g. "Default", "Social Media"
  final String service;

  @override
  /// Props for the SendMessageEvent
  List<Object?> get props => [message, servicePrompt, service];

  /// Constructor for the SendMessageEvent
  SendMessageEvent(this.message, this.servicePrompt, this.service);
}
