import 'package:client/features/onboarding/presentation/widgets/current_page_index_widget.dart';
import 'package:client/features/onboarding/presentation/widgets/onboarding_page_widget.dart';
import 'package:client/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

/// Onboarding screen — фича onboarding (Clean Architecture).
class OnboardingScreen extends StatefulWidget {
  /// Constructor for the OnboardingScreen
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Map<String, Map<String, String>> info = {
    '0': {
      'image': 'assets/images/onb_1.png',
      'title': 'Unlock The Power\nOf Future Ai',
      'description':
          '''Chat with the smartest AI Future\nExperience power of AI with us''',
    },
    '1': {
      'image': 'assets/images/onb_2.png',
      'title': 'Chat With Your\nFavorite AI',
      'description':
          '''Chat with the smartest AI Future\nExperience power of AI with us''',
    },
    '2': {
      'image': 'assets/images/onb_3.png',
      'title': 'Boost Your Mind\nPower with AI',
      'description':
          '''Chat with the smartest AI Future\nExperience power of AI with us''',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: info.length,
              itemBuilder: (_, index) {
                return OnboardingPageWidget(
                  image: info[index.toString()]?['image'] ?? '',
                  title: info[index.toString()]?['title'] ?? '',
                  description: info[index.toString()]?['description'] ?? '',
                );
              },
            ),
          ),
          Container(
            width: 156,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _currentPage == 2
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const WelcomeScreen(),
                          transitionsBuilder: (_, animation, ___, child) =>
                              FadeTransition(opacity: animation, child: child),
                        ),
                      );
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _currentPage == 2
                          ? const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: _currentPage == 0 ? Colors.grey : Colors.black,
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Color(0xFF8E9295),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              info.length,
              (index) => CurrentPageIndexWidget(
                currentPage: _currentPage,
                index: index,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
