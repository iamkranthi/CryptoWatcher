import 'package:flutter/material.dart';

class AppColors {
  static const darkBackground = Color.fromRGBO(30, 30, 30, 0.8);
  static const whiteBackground = Color.fromRGBO(255, 255, 255, 0.9);
  static const primaryText = Color(0x00ffffff);
  static const secondaryText = Color(0x00bfbfbf);
  static const accent = Color(0x0000ff00);

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: accent,
    textTheme: const TextTheme(),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteBackground,
    primaryColor: accent,
    textTheme: const TextTheme(),
  );
}
