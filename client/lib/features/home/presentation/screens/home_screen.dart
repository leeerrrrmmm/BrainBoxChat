import 'package:client/features/home/widgets/get_started_home_btn.dart';
import 'package:flutter/material.dart';

/// Home screen — экран в фиче home (Clean Architecture).
class HomeScreen extends StatelessWidget {
  /// Constructor for the HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Image.asset('assets/images/logo.png'),
            const Text(
              textAlign: TextAlign.center,
              'Welcome to\nBrainBox',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              textAlign: TextAlign.center,
              'Start chatting with ChattyAI now.\nYou can ask me anything.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const GetStartedHomeBtn(),
          ],
        ),
      ),
    );
  }
}
