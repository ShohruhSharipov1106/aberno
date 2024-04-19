import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WeekStatCard extends StatelessWidget {
  final String title;
  final Color color;
  final String suffix;
  final Color suffixStyleColor;
  final Color suffixBackColor;
  const WeekStatCard(
      {required this.title,
      required this.color,
      required this.suffix,
      required this.suffixStyleColor,
      required this.suffixBackColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      height: 48,
      width: double.maxFinite,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Container(
            width: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: suffixBackColor,
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 4),
            child: Text(
              suffix,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: suffixStyleColor,
                    fontSize: 13,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
