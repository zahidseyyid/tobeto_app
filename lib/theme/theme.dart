import 'package:flutter/material.dart';

class AppTheme {
  // TODO: Düzenlenecek
  static final ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: Color(0xFFfbf9fd),
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
