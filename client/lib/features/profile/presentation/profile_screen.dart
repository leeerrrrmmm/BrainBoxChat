import 'package:client/features/profile/widgets/profile_action_btn_widget.dart';
import 'package:flutter/material.dart';

/// Profile screen for the profile feature
class ProfileScreen extends StatefulWidget {
  /// Constructor for the ProfileScreen
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 51, 20, 0),
          child: Column(
            spacing: 20,
            children: [
              const Text(
                'Profile',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 61, top: 44),
                child: Column(
                  children: [
                    Container(
                      width: 106,
                      height: 112,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/onb_1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Tom Hillson',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Tomhill@mail.com',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                spacing: 30,
                children: [
                  ProfileActionBtnWidget(
                    icon: Icons.settings_outlined,
                    title: 'Preferences',
                    onTap: () {
                      // TODO: Implement preferences screen
                    },
                  ),
                  ProfileActionBtnWidget(
                    icon: Icons.lock_outline,
                    title: 'Account Security',
                    onTap: () {
                      // TODO: Implement preferences screen
                    },
                  ),
                  ProfileActionBtnWidget(
                    icon: Icons.headset_mic_outlined,
                    title: 'Customer Support',
                    onTap: () {
                      // TODO: Implement preferences screen
                    },
                  ),
                  ProfileActionBtnWidget(
                    icon: Icons.logout_outlined,
                    title: 'Logout',
                    onTap: () {
                      // TODO: Implement preferences screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
