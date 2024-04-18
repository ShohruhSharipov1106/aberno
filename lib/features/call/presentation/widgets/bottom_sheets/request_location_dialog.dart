import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestLocationDialog extends StatelessWidget {
  const RequestLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.locationBig,
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text(
              "Поделитесь своей локацией для того, чтобы мы убедились что вы на территории учреждения",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(AppImages.googleMap),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  right: 120,
                  child: CircleAvatar(
                    backgroundColor: sunsetOrange.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(AppImages.locationRed),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          WButton(
            onTap: () {},
            text: "Поделиться",
            height: 50,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
