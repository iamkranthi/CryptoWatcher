import 'package:flutter/material.dart';

class AppColors {
  static const darkBackground = Color.fromRGBO(30, 30, 30, 0.8);
  static const whiteBackground = Color.fromRGBO(255, 255, 255, 1);
  static const primaryText = Color.fromARGB(255, 61, 179, 205);
  static const sliverDark = Color.fromRGBO(200, 200, 200, 1);
  static const sliverWhite = Color.fromRGBO(64, 64, 64, 1);
  static const bluegrey = Color.fromARGB(255, 102, 129, 143);
  static const green = Color.fromARGB(255, 72, 177, 126);
  static const blue =  Color.fromARGB(255, 74, 130, 182);
  static const red = Color.fromARGB(255, 181, 70, 40);
  
  static final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: sliverDark,
      textTheme: const TextTheme(),
      iconTheme: const IconThemeData(color: whiteBackground));

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    cardColor: whiteBackground,
    scaffoldBackgroundColor: whiteBackground,
    primaryColor: sliverWhite,
    iconTheme: const IconThemeData(color: darkBackground),
  );
}
