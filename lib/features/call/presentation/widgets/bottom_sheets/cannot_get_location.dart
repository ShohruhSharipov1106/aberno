import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CannotGetLocation extends StatelessWidget {
  const CannotGetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      height: 350,
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Text(
                "Вы не на территории учреждения, пожалуйста, попробуйте еще раз когда прибудете на работу",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Text(
                "Пока мы заблокируем некоторые функции на вашем аккаунте",
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
            text: "Понятно",
            height: 50,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
