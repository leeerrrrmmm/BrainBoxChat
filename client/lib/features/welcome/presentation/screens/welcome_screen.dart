import 'package:client/features/welcome/presentation/widgets/google_facebook_btn_widget.dart';
import 'package:client/features/welcome/presentation/widgets/welcome_screen_btn.dart';
import 'package:client/shared/navigation/navigation.dart';
import 'package:flutter/material.dart';

/// Welcome screen — фича welcome (Clean Architecture).
class WelcomeScreen extends StatefulWidget {
  /// Constructor for the WelcomeScreen
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Image.asset('assets/images/logo.png'),
            const Text(
              textAlign: TextAlign.center,
              'Welcome to\nBrainBox',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            WelcomeScreenBtn(
              width: double.infinity,
              borderRadius: 25,
              label: 'Login',
              color: Colors.black,
              textColor: Colors.white,
              onTap: () {
                // TODO: Navigate to LoginScreen (auth feature) or use AuthBloc
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const Navigation(),
                    transitionsBuilder: (_, animation, ___, child) =>
                        FadeTransition(opacity: animation, child: child),
                  ),
                );
              },
            ),
            WelcomeScreenBtn(
              width: double.infinity,
              borderRadius: 25,
              label: 'Sign Up',
              color: Colors.grey.shade300,
              textColor: Colors.black,
              onTap: () {
                // TODO: implement register (AuthBloc)
              },
            ),
            Text(
              'Continue With Accounts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
            const GoogleFacebookBtnWidget(),
          ],
        ),
      ),
    );
  }
}
