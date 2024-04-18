import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: aliceBlue, width: 1),
        borderRadius: BorderRadius.circular(60),
      ),
      width: 42,
      height: 42,
      margin: EdgeInsets.fromLTRB(8, 8, 32, 8),
      padding: EdgeInsets.all(8),
      child: SvgPicture.asset(AppIcons.notifications),
    );
  }
}
