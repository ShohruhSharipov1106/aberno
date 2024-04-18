import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: 36,
      height: 5,
      decoration: BoxDecoration(
        color: ghost,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
