import 'package:client/core/constants/app_constants.dart';
import 'package:client/features/chat/presentation/screen/chat_screen.dart';
import 'package:client/features/services/widgets/choose_service_widget.dart';
import 'package:flutter/material.dart';

/// Services screen for the services feature
class ServicesScreen extends StatelessWidget {
  /// Constructor for the ServicesScreen
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const services = AppConstants.services;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 25),
          const Text(
            'AI Assistant',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),

          ...services.map((service) {
            return ChooseServiceWidget(
              category: service,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      service: service.title,
                      servicePrompt: service.items.first.description,
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
