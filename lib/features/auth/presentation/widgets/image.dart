import 'package:aberno_test/core/utils/my_functions.dart';
import 'package:aberno_test/features/auth/domain/entities/slide_entity.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final List<SlideEntity> products;
  final int index;

  const ImageProduct(this.products, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            MyFunctions.getOnboardingImagesPath(index: index + 1),
          ),
        ),
      ),
    );
  }
}
