import 'package:flutter/material.dart';

/// First chat action widget for the chat screen
class FirstChatActionWidget extends StatelessWidget {
  /// First text action for the first chat action widget
  final String firstTextAction;

  /// First action for the first chat action widget
  final void Function()? firstAction;

  /// Constructor for the FirstChatActionWidget
  const FirstChatActionWidget({
    required this.firstTextAction,
    required this.firstAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: firstAction,
      child: Container(
        width: double.infinity,
        height: 82,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            firstTextAction,
            style: const TextStyle(fontSize: 16, color: Color(0xFFA0A0A5)),
          ),
        ),
      ),
    );
  }
}
