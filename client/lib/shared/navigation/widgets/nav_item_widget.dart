import 'package:flutter/material.dart';

/// Nav item widget for the navigation screen
class NavItemWidget extends StatelessWidget {
  /// Constructor for the NavItemWidget
  const NavItemWidget({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  /// Icon for the nav item
  final IconData icon;

  /// Whether the nav item is active
  final bool isActive;

  /// On tap callback
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(top: isActive ? 0 : 10),
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.black : Colors.grey,
              size: 27,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            margin: EdgeInsets.only(bottom: !isActive ? 0 : 10),
            duration: const Duration(milliseconds: 300),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
