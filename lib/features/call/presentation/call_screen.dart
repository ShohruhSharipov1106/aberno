import 'dart:math';

import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/core/data/singletons/storage.dart';
import 'package:aberno_test/features/call/domain/entity/day_type_entity.dart';
import 'package:aberno_test/features/call/presentation/screens/sick_days_screen.dart';
import 'package:aberno_test/features/call/presentation/widgets/app_bar_leading.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/cannot_get_location.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/day_off_error.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/day_off_success.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/input_reason.dart';
import 'package:aberno_test/features/call/presentation/widgets/day_type_widget.dart';
import 'package:aberno_test/features/call/presentation/screens/history_tab_view.dart';
import 'package:aberno_test/features/call/presentation/widgets/notification_widget.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/request_location_dialog.dart';
import 'package:aberno_test/features/call/presentation/widgets/bottom_sheets/sent_location.dart';
import 'package:aberno_test/features/call/presentation/widgets/tab_bar_widget.dart';
import 'package:aberno_test/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<DayTypeEntity> dayTypes;
  late ValueNotifier<int> historyIndex;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    historyIndex = ValueNotifier(0);
    dayTypes = [
      DayTypeEntity(
        name: "Вышел на работу",
        id: 0,
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) {
              return RequestLocationDialog();
            },
          );
        },
      ),
      DayTypeEntity(
        name: "Выходной день",
        id: 1,
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) {
              if (Random().nextBool()) {
                return DayOffSuccess();
              } else {
                return DayOffError();
              }
            },
          );
        },
      ),
      DayTypeEntity(
        name: "На больничном",
        id: 2,
        onTap: () {
          Navigator.of(context).push(
            fade(page: const SickDaysScreen()),
          );
        },
      ),
      DayTypeEntity(
        name: "Есть причина",
        id: 3,
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return InputReason(title: "Укажите причину отсутствия");
              });
        },
      ),
      DayTypeEntity(
        name: "Не работает локация",
        id: 4,
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return InputReason(title: "Укажите причину проблемы");
              });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeading(
          onTap: () {},
        ),
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80,
        title: Text(
          "Пн, 25 марта",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: prussianBlue,
                fontSize: 18,
              ),
        ),
        actions: [NotificationWidget()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Давайте проведем\nперекличку  🙌",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          TabBarWidget(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Wrap(
                  children: List.generate(
                    dayTypes.length,
                    (index) => DayTypeWidget(
                      title: dayTypes[index].name,
                      onTap: dayTypes[index].onTap,
                      width: index != 4 ? 0.4 : 1,
                    ),
                  ),
                ),
                HistoryTabView(notifier: historyIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
