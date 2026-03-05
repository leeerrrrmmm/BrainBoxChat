import 'package:flutter/material.dart';

/// Service item widget
class ServiceItemWidget extends StatelessWidget {
  /// Asset for the service item
  final String asset;

  /// Title for the service item
  final String title;

  /// Description for the service item
  final String description;

  /// On tap callback
  final void Function()? onTap;

  /// Constructor for the ServiceItemWidget
  const ServiceItemWidget({
    required this.asset,
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 130,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(asset),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: const CircleAvatar(
                backgroundColor: Color(0xFFA0A0A5),
                radius: 15,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
