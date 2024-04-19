import 'package:aberno_test/features/call/presentation/widgets/week_stat_card.dart';
import 'package:flutter/material.dart';

class CustomDateHistory extends StatelessWidget {
  const CustomDateHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeekStatCard(
          title: "Пришел вовремя",
          color: Color(0xFF0BAC00),
          suffixStyleColor: Color(0xFF0BAC00),
          suffix: "08",
          suffixBackColor: Color(0xFFA9F2A4),
        ),
        WeekStatCard(
          title: "Не пришел",
          color: Color(0xFFE92020),
          suffixStyleColor: Color(0xFFE92020),
          suffix: "02",
          suffixBackColor: Color(0xFFFFB1B1),
        ),
        WeekStatCard(
          title: "Опоздал на работу",
          color: Color(0xFFFFB1B1),
          suffixStyleColor: Color(0xFFE92020),
          suffix: "02",
          suffixBackColor: Color(0xFFFFB1B1),
        ),
        WeekStatCard(
          title: "Больничный",
          color: Color(0xFF9BBFE5),
          suffixStyleColor: Color(0xFF007AFF),
          suffix: "00",
          suffixBackColor: Color(0xFF9BBFE5),
        ),
      ],
    );
    ;
  }
}
