import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarLeading extends StatelessWidget {
  final VoidCallback onTap;
  const AppBarLeading({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: aliceBlue, width: 1),
          borderRadius: BorderRadius.circular(60),
        ),
        width: 42,
        height: 42,
        margin: EdgeInsets.fromLTRB(16, 8, 24, 8),
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(AppIcons.category),
      ),
    );
  }
}
