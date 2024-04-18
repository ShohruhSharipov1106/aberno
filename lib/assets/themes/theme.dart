import 'package:aberno_test/assets/colors/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: scaffoldBackground,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(color: white),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(disabledText),
        ),
        textTheme: const TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
          headlineMedium: headline4,
          headlineSmall: headline5,
          titleLarge: headline6,
          bodyLarge: bodyText1,
          bodyMedium: bodyText2,
          titleMedium: subTitle1,
          titleSmall: subTitle2,
          bodySmall: caption,
          labelLarge: button,
          labelSmall: overline,
        ),
        colorScheme: const ColorScheme(
          background: white,
          brightness: Brightness.light,
          primary: mainColor,
          secondary: secondaryColor,
          error: errorRed,
          surface: mainColor,
          onPrimary: white,
          onSecondary: secondaryColor,
          onBackground: white,
          onError: errorRed,
          onSurface: white,
        ),
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w700,
    color: black,
  );
  static const headline2 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: prussianBlue,
  );
  static const headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: nero,
  );
  static const headline4 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: disabledButton,
  );
  static const headline5 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: raven,
  );
  static const headline6 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: manatee,
  );
  static const bodyText1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static const bodyText2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ghostWhite,
  );

  static const subTitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: dimGray,
  );

  static const subTitle2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: charcoal,
  );

  static const caption = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: mainColor,
  );

  static const button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const overline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  );
}
