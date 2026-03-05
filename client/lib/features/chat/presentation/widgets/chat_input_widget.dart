import 'package:flutter/material.dart';

/// Поле ввода и кнопка отправки для чата
class ChatInputWidget extends StatelessWidget {
  /// Контроллер текста
  final TextEditingController messageController;

  /// Колбэк отправки
  final ValueChanged<String> onSendMessage;

  /// Constructor for the ChatInputWidget
  const ChatInputWidget({
    required this.messageController,
    required this.onSendMessage,
    super.key,
  });

  void _handleSend() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    onSendMessage(text);
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: messageController,
              minLines: 1,
              maxLines: 4,
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
                hintText: 'Ask anything...',
                hintStyle: const TextStyle(color: Color(0xFFA0A0A5)),
              ),
              onFieldSubmitted: (_) => _handleSend(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _handleSend,
            icon: const Icon(Icons.send, color: Color(0xFF1E88E5)),
          ),
        ],
      ),
    );
  }
}
