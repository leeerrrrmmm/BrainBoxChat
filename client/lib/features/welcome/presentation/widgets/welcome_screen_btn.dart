import 'package:flutter/material.dart';

/// Welcome screen button for the app
class WelcomeScreenBtn extends StatelessWidget {
  /// Label for the button
  final String label;

  /// Color for the button
  final Color color;

  /// Text color for the button
  final Color textColor;

  /// On pressed callback
  final void Function()? onTap;

  /// Width for the button
  final double width;

  /// Border radius for the button
  final double borderRadius;

  /// Constructor for the WelcomeScreenBtn
  const WelcomeScreenBtn({
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
    required this.width,
    required this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
