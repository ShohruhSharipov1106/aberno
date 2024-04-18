import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/assets/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.authBackground),
            ),
          ),
          child: Column(
            children: [
              const Spacer(flex: 4),
              Image.asset(AppImages.mainLogo, width: 156, height: 128),
              const SizedBox(width: 12),
              Text(
                "Aberno Group",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Spacer(flex: 3),
              Text(
                "Musait Technologies",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
