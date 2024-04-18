import 'package:aberno_test/features/auth/domain/entities/slide_entity.dart';
import 'package:aberno_test/features/auth/presentation/widgets/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: IntroSlider(
        context: context,
        product: const [
          SlideEntity(
            label: "Работать стало проще и комфортнее",
            subLabel: "Автоматический учет посещений и мониторинг сотрудников",
          ),
          SlideEntity(
            label: "Отмечайте время посещения работы",
            subLabel: "Отмечайтесь каждое утро с 7:15 до 9:10",
          ),
          SlideEntity(
            label: "Проверка локации",
            subLabel:
                "Проверка локации работника каждый час в течение рабочего дня",
          ),
        ],
      ),
    );
  }
}
