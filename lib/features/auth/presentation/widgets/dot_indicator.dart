import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    required this.currentPage,
    required this.onPageSelected,
    super.key,
  });

  final int currentPage;
  final ValueChanged<int> onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onPageSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 7,
            width: index == currentPage ? 18 : 7,
            margin: EdgeInsets.only(right: index == 4 ? 0 : 4),
            decoration: BoxDecoration(
              color: index == currentPage
                  ? mainColor
                  : disabledButton.withOpacity(0.6),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
