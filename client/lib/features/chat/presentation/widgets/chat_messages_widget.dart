import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:client/features/chat/presentation/widgets/chat_message_item.dart';
import 'package:flutter/material.dart';

/// Список сообщений чата + контейнер "Generate answer..." при загрузке
class ChatMessagesWidget extends StatelessWidget {
  /// Сообщения для отображения
  final List<ChatMessageEntity> messages;

  /// Показывать ли блок "Generate answer..." (пока генерируется ответ)
  final bool showGenerateAnswer;

  /// Constructor for the ChatMessagesWidget
  const ChatMessagesWidget({
    required this.messages,
    this.showGenerateAnswer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = messages.length + (showGenerateAnswer ? 1 : 0);

    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      reverse: true,
      itemCount: itemCount,
      itemBuilder: (_, index) {
        if (showGenerateAnswer && index == 0) {
          return const _GenerateAnswerPlaceholder();
        }
        final messageIndex = index - (showGenerateAnswer ? 1 : 0);
        final message = messages[messages.length - 1 - messageIndex];

        return ChatMessageItem(message: message);
      },
    );
  }
}

class _GenerateAnswerPlaceholder extends StatelessWidget {
  const _GenerateAnswerPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: const BoxDecoration(
          color: Color(0xFFF1F1F4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Generate answer...',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
