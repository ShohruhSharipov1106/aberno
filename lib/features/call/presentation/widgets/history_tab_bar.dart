import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/call/presentation/history_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryTabBar extends StatelessWidget {
  final ValueNotifier<int> notifier;
  const HistoryTabBar({required this.notifier, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      height: 60,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          HistoryTabItem(
            notifier: notifier,
            index: 0,
            icon: AppIcons.calendar,
          ),
          HistoryTabItem(
            notifier: notifier,
            index: 1,
            title: "Эта неделя",
          ),
          HistoryTabItem(
            notifier: notifier,
            index: 2,
            title: "Прошлая неделя",
          ),
        ],
      ),
    );
  }
}
