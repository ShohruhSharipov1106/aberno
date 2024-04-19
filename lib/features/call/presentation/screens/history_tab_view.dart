import 'package:aberno_test/features/call/presentation/widgets/history_tab_bar.dart';
import 'package:aberno_test/features/call/presentation/widgets/history_tab_content.dart';
import 'package:flutter/material.dart';

class HistoryTabView extends StatefulWidget {
  final ValueNotifier<int> notifier;
  const HistoryTabView({required this.notifier, super.key});

  @override
  State<HistoryTabView> createState() => _HistoryTabViewState();
}

class _HistoryTabViewState extends State<HistoryTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HistoryTabBar(notifier: widget.notifier),
        Expanded(child: HistoryTabContent(notifier: widget.notifier)),
      ],
    );
  }
}
