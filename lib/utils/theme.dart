import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: Colors.purple,
        secondary: Colors.black,
      ));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Colors.purple,
        secondary: Colors.white,
      ));
}
