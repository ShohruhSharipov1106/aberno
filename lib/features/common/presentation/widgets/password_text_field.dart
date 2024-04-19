import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/common/presentation/widgets/stroke_paint.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_text_fileld.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool hasError;
  final bool? isObscure;
  final Function()? suffixTap;

  const PasswordTextField(
      {required this.controller,
      required this.onChanged,
      this.hintText = '',
      this.title = '',
      this.hasError = false,
      this.isObscure = false,
      this.suffixTap,
      super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField>
    with TickerProviderStateMixin {
  late bool isObscure;
  late AnimationController animationController;
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    if (widget.isObscure == null) {
      animationController.forward();
      isObscure = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isObscure != null) {
      isObscure = widget.isObscure!;
      if (isObscure) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
    return WTextField(
      title: widget.title,
      controller: widget.controller,
      onChanged: widget.onChanged,
      isObscure: widget.isObscure != null ? widget.isObscure! : isObscure,
      hasError: widget.hasError,
      hintText: widget.hintText,
      maxLines: 1,
      style: Theme.of(context).textTheme.titleMedium,
      titleStyle: Theme.of(context).textTheme.displaySmall,
      suffix: GestureDetector(
        onTap: widget.suffixTap ??
            () {
              setState(() {
                isObscure = !isObscure;
              });
              if (isObscure) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
            },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 4),
              child: SvgPicture.asset(AppIcons.eye),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => SizedBox(
                width: 28,
                height: 28,
                child: CustomPaint(
                  foregroundPainter: StrokePaint(animationController.value),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
