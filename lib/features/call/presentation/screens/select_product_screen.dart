import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:aberno_test/features/call/presentation/call_screen.dart';
import 'package:aberno_test/features/call/presentation/widgets/select_products_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectProductScreen extends StatelessWidget {
  const SelectProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 180, 20, 20),
            child: Text(
              "Выберите, пожалуйста, направление вашего отдела",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          SelectProductsItem(
            image: AppImages.margarine,
            title: "Маргарин",
            subtitle: "dfogofgofdhgoh gfngkdfjgnfn",
            onTap: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) => CallScreen(),
                ),
              );
            },
          ),
          SelectProductsItem(
            image: AppImages.napkin,
            title: "Салфетки",
            subtitle: "sfgsgfgdfgdf fg dgdrg dg ",
            onTap: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) => CallScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
