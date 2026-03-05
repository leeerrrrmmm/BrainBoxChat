import 'package:client/features/history/presentation/screens/history_screen.dart';
import 'package:client/features/home/presentation/screens/home_screen.dart';
import 'package:client/features/profile/presentation/screens/profile_screen.dart';
import 'package:client/features/services/presentation/screens/services_screen.dart';
import 'package:client/shared/navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

/// Shell навигации с нижней панелью (Clean: общий UI, экраны из features).
/// Первая вкладка — Chat, далее Services, History, Profile.
class Navigation extends StatefulWidget {
  /// Constructor for the Navigation
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _curPage = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ServicesScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _curPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: _curPage,
          children: _pages,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomBottomNavBar(
            currentIndex: _curPage,
            onTap: _onItemTapped,
          ),
        ),
      ],
    );
  }
}
