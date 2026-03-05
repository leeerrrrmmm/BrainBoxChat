import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:flutter/material.dart';

/// Виджет одного сообщения (user/assistant bubble)
class ChatMessageItem extends StatelessWidget {
  /// Сообщение
  final ChatMessageEntity message;

  /// Constructor for the ChatMessageItem
  const ChatMessageItem({required this.message, super.key});

  bool get _isUser => message.role == ChatMessageEntityRole.user;

  @override
  Widget build(BuildContext context) {
    final alignment = _isUser ? Alignment.topRight : Alignment.topLeft;
    final color = _isUser ? const Color(0xFF1E88E5) : const Color(0xFFF1F1F4);
    final textColor = _isUser ? Colors.white : Colors.black87;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(_isUser ? 16 : 4),
            bottomRight: Radius.circular(_isUser ? 4 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.content,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            if (!_isUser &&
                message.modelId != null &&
                (message.modelId?.isNotEmpty ?? false))
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  message.modelId ?? '',
                  style: TextStyle(
                    color: textColor.withValues(alpha: 0.6),
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
