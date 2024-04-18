import 'package:aberno_test/assets/themes/theme.dart';
import 'package:aberno_test/core/data/singletons/service_locator.dart';
import 'package:aberno_test/core/data/singletons/storage.dart';
import 'package:aberno_test/features/auth/presentation/auth_screen.dart';
import 'package:aberno_test/features/auth/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:aberno_test/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:aberno_test/features/auth/presentation/screens/splash_screen.dart';
import 'package:aberno_test/features/call/presentation/call_screen.dart';
import 'package:aberno_test/features/call/presentation/screens/select_product_screen.dart';
import 'package:aberno_test/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:aberno_test/features/navigation/presentation/home.dart';
import 'package:aberno_test/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool serviceStatus = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShowPopUpBloc()),
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aberno',
          navigatorKey: _navigatorKey,
          theme: AppTheme.theme(),
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.unauthenticated:
                    if (StorageRepository.getBool(StoreKeys.onboarding)) {
                      navigator.pushAndRemoveUntil(
                        fade(page: const AuthScreen()),
                        (route) => false,
                      );
                    } else {
                      navigator.pushAndRemoveUntil(
                        fade(page: const OnboardingScreen()),
                        (route) => false,
                      );
                    }
                    break;
                  case AuthenticationStatus.authenticated:
                    navigator.pushAndRemoveUntil(
                      fade(page: const HomeScreen()),
                      (route) => false,
                    );

                    break;
                }
              },
              child: child,
            );
          },
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
