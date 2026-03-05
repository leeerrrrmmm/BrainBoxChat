import 'package:flutter/material.dart';

/// Top buttons widget for the chat screen
class TopBtnsWidget extends StatelessWidget {
  /// Constructor for the TopBtnsWidget
  const TopBtnsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement more options
          },
          icon: const Icon(
            Icons.more_horiz,
            size: 40,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
