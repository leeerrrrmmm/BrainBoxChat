import 'package:client/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:client/features/chat/presentation/widgets/chat_input_widget.dart';
import 'package:client/features/chat/presentation/widgets/chat_messages_widget.dart';
import 'package:client/features/chat/presentation/widgets/empty_chat_state_widget.dart';
import 'package:client/features/chat/presentation/widgets/top_btns_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Chat screen for the chat feature
class ChatScreen extends StatefulWidget {
  /// Service for the chat screen
  final String service;

  /// Service prompt for the chat screen (optional)
  final String? servicePrompt;

  /// Constructor for the ChatScreen
  const ChatScreen({required this.service, this.servicePrompt, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final prompt = widget.servicePrompt;
    if (widget.service != 'Default' && prompt != null && prompt.isNotEmpty) {
      context.read<ChatBloc>().add(
        SendMessageEvent(prompt, null, widget.service),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocBuilder<ChatBloc, ChatBlocState>(
          buildWhen: (previous, current) =>
              previous.chats != current.chats ||
              previous.loadingService != current.loadingService ||
              previous.errorMessage != current.errorMessage,
          builder: (context, state) {
            final messages = state.messagesFor(widget.service);
            final isLoadingThisChat = state.loadingService == widget.service;

            return messages.isEmpty && !isLoadingThisChat
                ? EmptyChatStateWidget(
                    messageController: _messageController,
                    service: widget.service,
                  )
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TopBtnsWidget(),
                      ),
                      Expanded(
                        child: ChatMessagesWidget(
                          messages: messages,
                          showGenerateAnswer: isLoadingThisChat,
                        ),
                      ),
                      if (state.errorMessage != null) ...[
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.orange.shade200,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: Colors.orange.shade800,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  state.errorMessage ?? '',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      ChatInputWidget(
                        messageController: _messageController,
                        onSendMessage: (message) {
                          context.read<ChatBloc>().add(
                            SendMessageEvent(
                              message,
                              widget.servicePrompt,
                              widget.service,
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
