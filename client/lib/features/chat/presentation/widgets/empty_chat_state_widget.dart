import 'package:client/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:client/features/chat/presentation/widgets/first_chat_action_widget.dart';
import 'package:client/features/chat/presentation/widgets/top_btns_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Empty chat state widget for the chat screen
class EmptyChatStateWidget extends StatefulWidget {
  /// Message controller for the empty chat state widget
  final TextEditingController messageController;

  /// Current chat key (service/category), e.g. "Default", "Social Media"
  final String service;

  /// Constructor for the EmptyChatStateWidget
  const EmptyChatStateWidget({
    required this.messageController,
    required this.service,
    super.key,
  });

  @override
  State<EmptyChatStateWidget> createState() => _EmptyChatStateWidgetState();
}

class _EmptyChatStateWidgetState extends State<EmptyChatStateWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 14,
            children: [
              const TopBtnsWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 36.0, bottom: 31.0),
                child: Text(
                  'BrainBox',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF757474),
                  ),
                ),
              ),
              FirstChatActionWidget(
                firstTextAction:
                    '''Remembers what user said\nearlier in the conversation''',
                firstAction: () {
                  // TODO: Implement weather action
                },
              ),
              FirstChatActionWidget(
                firstTextAction:
                    '''Allows user to provide.\nfollow-up corrections With Ai''',
                firstAction: () {
                  // TODO: Implement calculator action
                },
              ),
              FirstChatActionWidget(
                firstTextAction:
                    '''Limited knowledge of world\nand events after 2021''',
                firstAction: () {
                  // TODO: Implement calculator action
                },
              ),
              FirstChatActionWidget(
                firstTextAction:
                    'May occasionally generate\nincorrect information',
                firstAction: () {
                  // TODO: Implement calculator action
                },
              ),
              FirstChatActionWidget(
                firstTextAction:
                    '''May occasionally produce harmful\ninstructions or biased content''',
                firstAction: () {
                  // TODO: Implement calculator action
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: widget.messageController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFE1E1E1)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      final text = widget.messageController.text.trim();
                      if (text.isEmpty) return;
                      context.read<ChatBloc>().add(
                        SendMessageEvent(text, null, widget.service),
                      );
                      widget.messageController.clear();
                    },
                    icon: const Icon(Icons.send, color: Color(0xFFDDDDE4)),
                  ),
                  hintText: 'Ask anything...',
                  hintStyle: const TextStyle(color: Color(0xFFA0A0A5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
