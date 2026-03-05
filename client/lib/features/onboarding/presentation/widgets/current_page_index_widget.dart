import 'package:flutter/material.dart';

/// Widget for the current page index
class CurrentPageIndexWidget extends StatelessWidget {
  /// Constructor for the CurrentPageIndexWidget
  const CurrentPageIndexWidget({
    required int currentPage,
    required int index,
    super.key,
  }) : _currentPage = currentPage,
       _index = index;

  final int _currentPage;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      width: _currentPage == _index ? 18 : 10,
      height: _currentPage == _index ? 18 : 10,
      decoration: _currentPage == _index
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2),
            )
          : null,
      child: Center(
        child: _currentPage == _index
            ? Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              )
            : Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }
}
