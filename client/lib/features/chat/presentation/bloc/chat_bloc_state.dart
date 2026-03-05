part of 'chat_bloc.dart';

@immutable
/// State for the ChatBloc
class ChatBlocState extends Equatable {
  /// Per-category chats: key = service/category name (e.g. "Default", "Social Media")
  final Map<String, List<ChatMessageEntity>> chats;

  /// Which chat is currently loading (service key). Null when none.
  final String? loadingService;

  /// Last error. Cleared on next send.
  final String? errorMessage;

  /// Messages for a given service (helper)
  List<ChatMessageEntity> messagesFor(String service) =>
      chats[service] ?? const [];

  @override
  List<Object?> get props => [chats, loadingService, errorMessage];

  /// Constructor for the ChatState
  const ChatBlocState({
    this.chats = const {},
    this.loadingService,
    this.errorMessage,
  });

  /// Copy with method for the ChatState
  ChatBlocState copyWith({
    Map<String, List<ChatMessageEntity>>? chats,
    String? loadingService,
    String? errorMessage,
  }) {
    return ChatBlocState(
      chats: chats ?? this.chats,
      loadingService: loadingService,
      errorMessage: errorMessage,
    );
  }
}
