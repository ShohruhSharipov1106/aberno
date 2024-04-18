import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarWidget({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: charcoal.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 0),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      child: TabBar(
        controller: tabController,
        tabs: [Tab(text: "Перекличка"), Tab(text: "История посещений")],
        indicator: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(7),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 0,
        indicatorColor: Colors.transparent,
        labelStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13),
        unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
        dividerColor: Colors.transparent,
        dividerHeight: 0,
      ),
    );
  }
}
