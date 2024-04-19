import 'package:aberno_test/features/call/presentation/widgets/custom_date_history.dart';
import 'package:aberno_test/features/call/presentation/widgets/last_week_history.dart';
import 'package:aberno_test/features/call/presentation/widgets/this_week_history.dart';
import 'package:flutter/material.dart';

class HistoryTabContent extends StatelessWidget {
  final ValueNotifier<int> notifier;
  const HistoryTabContent({required this.notifier, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, child) {
        if (notifier.value == 1) {
          return ThisWeekHistory();
        } else if (notifier.value == 2) {
          return LastWeekHistory();
        } else {
          return child ?? SizedBox();
        }
      },
      child: CustomDateHistory(),
    );
  }
}
