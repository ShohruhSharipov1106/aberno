import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class SentLocation extends StatelessWidget {
  const SentLocation({super.key});

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
      height: 360,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: aliceBlue,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.all(30),
            height: 140,
            width: 140,
            child: Image.asset(
              AppImages.congrate,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              "Молодец, хорошего Вам рабочего дня!",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          WButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Понятно",
            height: 50,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
