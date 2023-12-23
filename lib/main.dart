import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tobeto',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      home: const MyStatefulWidget(),
    );
  }
}
