import 'package:client/features/welcome/presentation/widgets/welcome_screen_btn.dart';
import 'package:flutter/material.dart';

/// Google and Facebook button widget for the welcome screen
class GoogleFacebookBtnWidget extends StatelessWidget {
  /// Constructor for the GoogleFacebookBtnWidget
  const GoogleFacebookBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 14,
      children: [
        WelcomeScreenBtn(
          width: 150,
          borderRadius: 10,
          label: 'Google',
          color: const Color(0xFFD44638).withValues(alpha: 0.5),
          textColor: Colors.white,
          onTap: () {
            // TODO: implement google login (AuthBloc)
          },
        ),
        WelcomeScreenBtn(
          width: 150,
          borderRadius: 10,
          label: 'Facebook',
          color: Colors.black,
          textColor: Colors.white,
          onTap: () {
            // TODO: implement facebook login (AuthBloc)
          },
        ),
      ],
    );
  }
}
