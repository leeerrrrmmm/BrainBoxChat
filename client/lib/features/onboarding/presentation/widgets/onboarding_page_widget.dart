import 'package:flutter/material.dart';

/// Onboarding page widget for the app
class OnboardingPageWidget extends StatefulWidget {
  /// Constructor for the OnboardingPageWidget
  const OnboardingPageWidget({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  /// Image for the onboarding page
  final String image;

  /// Title for the onboarding page
  final String title;

  /// Description for the onboarding page
  final String description;

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(widget.image),
          Text(
            textAlign: TextAlign.center,
            widget.title,
            style: const TextStyle(
              fontSize: 33.9,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 16.3,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8E9295),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
