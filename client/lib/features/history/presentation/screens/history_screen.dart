import 'package:flutter/material.dart';

/// History screen — экран в фиче history (Clean Architecture).
class HistoryScreen extends StatelessWidget {
  /// Constructor for the HistoryScreen
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('History'),
        ],
      ),
    );
  }
}
