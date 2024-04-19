import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class DayOffError extends StatelessWidget {
  const DayOffError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.fromLTRB(
          20, 20, 20, MediaQuery.of(context).viewPadding.bottom + 16),
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.closeBig,
            width: 50,
            height: 50,
          ),
          Expanded(
            child: Center(
              child: Text(
                "Сегодня рабочий день,\nпожалуйста, свяжитесь с...",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          WButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Связаться",
            height: 50,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
