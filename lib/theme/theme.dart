import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Colors.black,
        secondary: Colors.purple,
      ));

  static final ThemeData darkMode = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Colors.white,
        secondary: Colors.purple,
      ));
}
