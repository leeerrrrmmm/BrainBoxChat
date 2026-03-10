import 'package:flutter/material.dart';

/// Profile action button widget for the profile screen
class ProfileActionBtnWidget extends StatelessWidget {
  /// Icon for the profile action button
  final IconData icon;

  /// Title for the profile action button
  final String title;

  /// On tap callback
  final void Function()? onTap;

  /// Constructor for the ProfileActionBtnWidget
  const ProfileActionBtnWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15,
            children: [
              Icon(icon, size: 35),
              if (title == 'Account Security')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Excellent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          if (title == 'Logout')
            const SizedBox.shrink()
          else
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}
