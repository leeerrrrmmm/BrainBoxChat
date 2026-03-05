import 'package:client/shared/navigation/widgets/nav_item_widget.dart';
import 'package:flutter/material.dart';

/// Custom bottom navigation bar for the app
class CustomBottomNavBar extends StatelessWidget {
  /// Constructor for the CustomBottomNavBar
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  /// Current index of the bottom navigation bar
  final int currentIndex;

  /// On tap callback
  final ValueChanged<int> onTap;

  static const List<IconData> _icons = [
    Icons.home,
    Icons.grid_view_rounded,
    Icons.history,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _icons.length,
            (index) => NavItemWidget(
              icon: _icons[index],
              isActive: currentIndex == index,
              onTap: () => onTap(index),
            ),
          ),
        ),
      ),
    );
  }
}
