import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/call/presentation/widgets/text_icon.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_text_fileld.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SickDaysScreen extends StatefulWidget {
  const SickDaysScreen({super.key});

  @override
  State<SickDaysScreen> createState() => _SickDaysScreenState();
}

class _SickDaysScreenState extends State<SickDaysScreen> {
  late TextEditingController reasonController;
  DateTime? pickedDate;
  TimeOfDay? startedHour;
  TimeOfDay? endedHour;
  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: WScaleAnimation(
            child: Padding(padding: EdgeInsets.fromLTRB(20, 8, 8, 8)),
            onTap: () {},
          ),
          elevation: 0,
          centerTitle: true,
          leadingWidth: 80,
          title: Text(
            "Больничный",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: prussianBlue,
                  fontSize: 18,
                ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: WTextField(
                controller: reasonController,
                onChanged: (value) {},
                fillColor: white,
                borderColor: aliceBlue,
                height: 50,
                expands: true,
                title: "Опишите по какой причине открываете больничный",
                hintText: "Кратко о причине...",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      color: rockBlue,
                    ),
                hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      color: rockBlue,
                    ),
                titleStyle: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            TextIconWidget(
              onTap: () async {
                pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: mainColor,
                          onPrimary: white,
                          onSurface: tiber,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                setState(() {});
              },
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              icon: AppIcons.calendar,
              text: pickedDate == null
                  ? "Даты"
                  : Jiffy.parseFromDateTime(pickedDate ?? DateTime.now())
                      .format(pattern: 'dd/MM/yy'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextIconWidget(
                    onTap: () async {
                      startedHour = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: mainColor,
                                onPrimary: white,
                                onSurface: tiber,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    icon: AppIcons.time,
                    text: startedHour == null
                        ? "Начало"
                        : Jiffy.parseFromDateTime(DateTime(2024, 1, 1,
                                startedHour!.hour, startedHour!.minute))
                            .format(pattern: 'HH:mm'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextIconWidget(
                    onTap: () async {
                      endedHour = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: mainColor,
                                onPrimary: white,
                                onSurface: tiber,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    icon: AppIcons.time,
                    text: endedHour == null
                        ? "Конец"
                        : Jiffy.parseFromDateTime(DateTime(
                                2024, 1, 1, endedHour!.hour, endedHour!.minute))
                            .format(pattern: 'HH:mm'),
                  ),
                ),
              ],
            ),
            WButton(
              onTap: () {
                Navigator.pop(context);
              },
              margin: EdgeInsets.fromLTRB(16, 32, 16, 16),
              text: "Спасибо!",
              height: 50,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
