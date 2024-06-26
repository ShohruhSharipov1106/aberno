import 'dart:ui';

import 'package:aberno_test/core/utils/interpolate.dart';
import 'package:aberno_test/features/auth/domain/entities/slide_entity.dart';
import 'package:aberno_test/features/auth/presentation/widgets/image.dart';
import 'package:flutter/material.dart';

class CustomBuilderAnimation extends StatefulWidget {
  final int index;
  final List<SlideEntity> products;
  final PageController pageController;
  final int currentPage;

  const CustomBuilderAnimation({
    super.key,
    required this.index,
    required this.products,
    required this.currentPage,
    required this.pageController,
  });

  @override
  State<CustomBuilderAnimation> createState() => _CustomBuilderAnimationState();
}

class _CustomBuilderAnimationState extends State<CustomBuilderAnimation> {
  Interpolate interpolate = Interpolate(
    inputRange: [0, .4],
    outputRange: [
      0.1,
      0,
    ],
    extrapolate: Extrapolate.clamp,
  );

  Interpolate interpolate2 = Interpolate(
    inputRange: [1, 1.9],
    outputRange: [
      0,
      -0.1,
    ],
    extrapolate: Extrapolate.clamp,
  );

  Interpolate interpolate3 = Interpolate(
    inputRange: [1, 1.9],
    outputRange: [
      0.1,
      0,
    ],
    extrapolate: Extrapolate.clamp,
  );

  Interpolate interpolate4 = Interpolate(
    inputRange: [1.9, 2.9],
    outputRange: [
      0.1,
      0,
    ],
    extrapolate: Extrapolate.clamp,
  );

  Interpolate interpolate5 = Interpolate(
    inputRange: [1.9, 2.9],
    outputRange: [
      0.1,
      -0.1,
    ],
    extrapolate: Extrapolate.clamp,
  );
  Interpolate interpolate6 = Interpolate(
    inputRange: [2.9, 3.9],
    outputRange: [
      0.1,
      0,
    ],
    extrapolate: Extrapolate.clamp,
  );
  @override
  Widget build(BuildContext context) {
    double width = 0;
    return AnimatedBuilder(
      animation: widget.pageController,
      child: ImageProduct(widget.products, widget.index),
      builder: (context, child) {
        return _buildInfoProduct(
          context,
          child ?? const SizedBox(),
          widget.index,
          width,
        );
      },
    );
  }

  Widget _buildInfoProduct(
      BuildContext context, Widget child, int index, double width) {
    double value = 1.0;
    double rotated = 0.0;
    if (widget.pageController.position.haveDimensions) {
      value = widget.pageController.page! - index;
      rotated = widget.pageController.page!;
      value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
    } else {
      if (index > 0) value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
    }
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    double? rotate(value) {
      switch (index) {
        case 0:
          return lerpDouble(0, -0.1, rotated);
        case 1:
          if (rotated < .5) {
            return interpolate.eval(rotated);
          } else {
            return interpolate2.eval(rotated);
          }
        case 2:
          if (rotated < 2.5) {
            return interpolate3.eval(rotated);
          } else {
            return interpolate5.eval(rotated);
          }
        case 3:
          if (rotated < 3.5) {
            return interpolate4.eval(rotated);
          } else {
            return interpolate5.eval(rotated);
          }
        case 4:
          return interpolate6.eval(rotated);
      }
      return null;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 200, right: 20),
      alignment: Alignment(
          0, MediaQuery.of(context).size.height < 812 ? -0.30 : -0.10),
      child: Transform.rotate(
        angle: rotate(value) ?? 0,
        child: SizedBox(
          height: Curves.linear.transform(value) * deviceHeight * 0.5,
          width: Curves.linear.transform(value) * deviceWidth * 0.6,
          child: index == widget.currentPage
              ? Column(
                  children: <Widget>[
                    Expanded(child: child),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    child: child,
                  ),
                ),
        ),
      ),
    );
  }
}
