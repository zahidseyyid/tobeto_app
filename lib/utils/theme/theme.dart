import 'package:flutter/material.dart';

class AppTheme {
  // TODO: Düzenlenecek
  static final ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Color(0xFFfbf9fd),
        primary: Colors.black,
        secondary: Color(0xFF9333FF),
      ));

  static final ThemeData darkMode = ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(),
      colorScheme: const ColorScheme.dark(
        background: Colors.black,
        primary: Colors.white,
        secondary: Color(0xFF9333FF),
      ));
}
