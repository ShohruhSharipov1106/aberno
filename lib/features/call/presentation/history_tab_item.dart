import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryTabItem extends StatelessWidget {
  final ValueNotifier<int> notifier;
  final int index;
  final String title;
  final String icon;

  const HistoryTabItem(
      {required this.notifier,
      required this.index,
      this.title = '',
      this.icon = '',
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            notifier.value = index;
          },
          child: Container(
            // height: 38,
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: notifier.value == index ? mainColor : white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: notifier.value == index
                  ? []
                  : [
                      BoxShadow(
                        color: charcoal.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 0),
                      )
                    ],
            ),

            alignment: Alignment.center,
            child: title.isEmpty
                ? SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      notifier.value != index ? manatee : white,
                      BlendMode.srcIn,
                    ),
                  )
                : Text(
                    title,
                    style: notifier.value == index
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 13)
                        : Theme.of(context).textTheme.titleLarge,
                  ),
          ),
        );
      },
    );
  }
}
