import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  const WDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: disabledButton,
      height: 1,
    );
  }
}
