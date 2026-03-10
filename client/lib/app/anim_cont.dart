import 'dart:math';

import 'package:flutter/material.dart';

/// Animation container for the app
class AnimCont extends StatefulWidget {
  /// Constructor for the AnimCont
  const AnimCont({super.key});

  @override
  State<AnimCont> createState() => _AnimContState();
}

class _AnimContState extends State<AnimCont>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // ignore: avoid_late_keyword
  late Animation<double> anim;

  int currentIndex = 0;
  bool isFront = true;

  final List<Map<String, dynamic>> data = [
    {"title": "Hello", "color": Colors.red},
    {"title": "Kurt", "color": Colors.blue},
    {"title": "Pidor", "color": Colors.green},
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    anim =
        Tween<double>(
          begin: 0,
          end: pi,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeInOut),
        );

    controller.addListener(() {
      // ignore: prefer_early_return, no_magic_number
      if (controller.value >= 0.5 && isFront) {
        setState(() {
          currentIndex = (currentIndex + 1) % data.length;
          isFront = false;
        });
      }
    });

    controller.addStatusListener((status) {
      // ignore: prefer_early_return
      if (status == AnimationStatus.completed) {
        isFront = true;
        controller.reset();
      }
    });
  }

  /// Flip the card
  void _flipCard() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final item = data[currentIndex];

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedBuilder(
            animation: anim,
            builder: (_, child) {
              final isUnder = anim.value > pi / 2;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(anim.value),
                child: isUnder
                    ? Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: child,
                      )
                    : child,
              );
            },
            child: _AnimatedContainer(
              title: item["title"] as String,
              color: item["color"] as Color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimatedContainer extends StatelessWidget {
  final String title;
  final Color color;

  const _AnimatedContainer({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
