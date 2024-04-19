import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayTypeWidget extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onTap;
  const DayTypeWidget(
      {required this.onTap,
      required this.title,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: charcoal.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 0),
            )
          ],
        ),
        height: 80,
        width: MediaQuery.of(context).size.width * width,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
          ),
        ),
      ),
    );
  }
}
