import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextIconWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String icon;
  final EdgeInsets margin;
  const TextIconWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: scaffoldBackground,
            border: Border.all(color: aliceBlue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 2),
              Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      color: rockBlue,
                    ),
              ),
              const Spacer(),
              SvgPicture.asset(
                icon,
                height: 24,
                colorFilter: ColorFilter.mode(rockBlue, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
