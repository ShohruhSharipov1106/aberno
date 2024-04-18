import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Text(
          'Идет проверка...',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: prussianBlue),
        ),
        const SizedBox(height: 10),
        Text(
          'Пожалуйста, подождите немного...',
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
