import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/core/data/singletons/storage.dart';
import 'package:aberno_test/features/auth/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:aberno_test/features/call/presentation/call_screen.dart';
import 'package:aberno_test/features/call/presentation/screens/select_product_screen.dart';
import 'package:aberno_test/features/common/presentation/widgets/loading_dialog.dart';
import 'package:aberno_test/features/common/presentation/widgets/password_text_field.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_text_fileld.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late bool hasErrorLogin;
  late bool hasErrorPassword;

  @override
  void initState() {
    super.initState();
    hasErrorLogin = false;
    hasErrorPassword = false;
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismisser(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.formStatus == FormzSubmissionStatus.success) {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) => const SelectProductScreen(),
                ),
              );
            } else if (state.formStatus == FormzSubmissionStatus.inProgress) {
              showAdaptiveDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog.adaptive(
                      title: LoadingDialog(),
                    );
                  });
            } else {
              setState(() {
                hasErrorLogin = true;
              });
            }
          },
          child: ListView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewInsets.top + 120,
              left: 16,
              right: 16,
            ),
            children: [
              Text(
                "Здравствуйте!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 32,
                      color: nero,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Для входа в свой аккаунт введите, пожалуйста, свои данные",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              WTextField(
                controller: loginController,
                onChanged: (value) {
                  setState(() {
                    hasErrorLogin = false;
                  });
                },
                title: "Логин",
                hintText: "Логин",
                hasError: hasErrorLogin,
                style: Theme.of(context).textTheme.titleMedium,
                titleStyle: Theme.of(context).textTheme.displaySmall,
                errorText: "Неверно введен логин или пароль",
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    hasErrorLogin = false;
                  });
                },
                title: "Пароль",
                hintText: "Пароль",
                hasError: hasErrorPassword,
              ),
              const SizedBox(height: 8),
              WScaleAnimation(
                child: Text(
                  "Восстановить пароль",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              WButton(
                onTap: () async {
                  if (loginController.text.isEmpty) {
                    setState(() {
                      hasErrorLogin = true;
                    });
                  }
                  if (passwordController.text.isEmpty) {
                    setState(() {
                      hasErrorPassword = true;
                    });
                  }
                  if (loginController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    context.read<AuthenticationBloc>().add(LoginEvent());
                  }
                },
                text: "Войти",
              )
            ],
          ),
        ),
      ),
    );
  }
}
