import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:aberno_test/features/navigation/domain/entity/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final NavBar navBar;
  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (navBar.isCenter) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(84),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 4,
              )
            ]),
        height: 50,
        width: 50,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Center(
          child: SvgPicture.asset(
            navBar.icon,
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(
              white,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: double.maxFinite,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Center(
          child: SvgPicture.asset(
            navBar.icon,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == navBar.id ? mainColor : aliminium,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    }
  }
}
