import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Colors.white,
        secondary: Colors.purple,
      ));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Colors.purple,
        secondary: Colors.white,
      ));
}
