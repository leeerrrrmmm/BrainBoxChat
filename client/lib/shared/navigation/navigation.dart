import 'package:client/features/history/bloc/history_bloc.dart';
import 'package:client/features/history/bloc/history_event.dart';
import 'package:client/features/history/presentation/history_screen.dart';
import 'package:client/features/home/presentation/screens/home_screen.dart';
import 'package:client/features/profile/presentation/profile_screen.dart';
import 'package:client/features/services/presentation/screens/services_screen.dart';
import 'package:client/shared/navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shell навигации с нижней панелью (Clean: общий UI, экраны из features).
/// Первая вкладка — Home, далее Services, History, Profile.
class Navigation extends StatefulWidget {
  /// Constructor for the Navigation
  const Navigation({super.key});

  /// Index of the History tab (used to reload history when selected)
  static const int historyTabIndex = 2;

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
    if (index == Navigation.historyTabIndex) {
      context.read<HistoryBloc>().add(LoadHistoryEvent());
    }
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
