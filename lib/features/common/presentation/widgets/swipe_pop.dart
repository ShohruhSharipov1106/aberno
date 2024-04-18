import 'dart:io';

import 'package:flutter/material.dart';

class SwipePop extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPop;

  const SwipePop({required this.child, this.onPop, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.localPosition.dx < MediaQuery.of(context).size.width / 5 &&
              details.localPosition.dx > MediaQuery.of(context).size.width / 10 &&
              Platform.isIOS) {
            if (onPop != null) {
              onPop!();
            }
            Navigator.of(context).pop();
          }
        },
        child: child,
      );
}
