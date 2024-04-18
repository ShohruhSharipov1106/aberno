import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectProductsItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const SelectProductsItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF323247).withOpacity(0.04),
            blurRadius: 20,
            spreadRadius: -2,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: const Color(0xFF0C1A4B).withOpacity(0.03),
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: 80,
                height: 60,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          WButton(
            onTap: onTap,
            color: pattensBlue,
            width: 44,
            height: 44,
            borderRadius: 16,
            child: SvgPicture.asset(
              AppIcons.arrowRight,
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
            ),
          )
        ],
      ),
    );
  }
}
