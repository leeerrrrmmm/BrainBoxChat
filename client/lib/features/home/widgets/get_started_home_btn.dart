import 'package:client/features/chat/presentation/screen/chat_screen.dart';
import 'package:flutter/material.dart';

/// Get started home button for the home screen
class GetStartedHomeBtn extends StatelessWidget {
  /// Constructor for the GetStartedHomeBtn
  const GetStartedHomeBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ChatScreen(service: 'Default'),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 35, right: 35, top: 100),
        width: double.infinity,
        height: 63,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
