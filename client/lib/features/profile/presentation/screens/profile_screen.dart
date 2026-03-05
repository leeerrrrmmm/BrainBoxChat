import 'package:flutter/material.dart';

/// Profile screen — экран в фиче profile (Clean Architecture).
class ProfileScreen extends StatelessWidget {
  /// Constructor for the ProfileScreen
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Profile'),
        ],
      ),
    );
  }
}
