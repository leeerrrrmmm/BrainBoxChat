import 'dart:async';

import 'package:client/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

/// Splash screen — фича splash (Clean Architecture).
class SplashScreen extends StatefulWidget {
  /// Constructor for the SplashScreen
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _topController;
  late final AnimationController _bottomController;
  late final AnimationController _fadeController;

  // ignore: avoid_late_keyword
  late final Animation<double> _fade;
  // ignore: avoid_late_keyword
  late final Animation<Offset> _bottomOffset;
  // ignore: avoid_late_keyword
  late final Animation<Offset> _topOffset;

  @override
  void initState() {
    super.initState();

    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _topOffset =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -1),
        ).animate(
          CurvedAnimation(parent: _topController, curve: Curves.easeInOut),
        );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _bottomOffset =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, 1),
        ).animate(
          CurvedAnimation(parent: _bottomController, curve: Curves.easeInOut),
        );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(_fadeController);

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;

    await Future.wait([
      _topController.forward(),
      _bottomController.forward(),
    ]);

    await _fadeController.forward();
    if (!context.mounted) return;

    unawaited(
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingScreen(),
          transitionsBuilder: (_, animation, ___, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          SlideTransition(
            position: _topOffset,
            child: const Align(
              alignment: Alignment.topCenter,
              child: SizedBox(height: 0),
            ),
          ),
          SlideTransition(
            position: _bottomOffset,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 39.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BrainBox',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fade,
            child: Container(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _topController.dispose();
    _bottomController.dispose();
    _fadeController.dispose();
    super.dispose();
  }
}
