import 'package:aberno_test/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:aberno_test/features/common/presentation/widgets/message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
        builder: (context, state) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            KeyboardDismisser(child: child),
            AnimatedPositioned(
              top: state.showPopUp
                  ? MediaQuery.of(context).padding.top + 12
                  : -(MediaQuery.of(context).padding.top + 12 + 56),
              left: 16,
              right: 16,
              duration: const Duration(milliseconds: 150),
              child: MessageContainer(
                message: state.message,
                isSuccess: state.isSuccess,
                isNotification: state.isNotification,
              ),
            )
          ],
        ),
      );
    });
  }
}
