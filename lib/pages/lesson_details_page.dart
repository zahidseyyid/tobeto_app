import 'package:flutter/material.dart';

class LessonDetailsPage extends StatefulWidget {
  const LessonDetailsPage({super.key, this.lessonId});
  final String? lessonId;
  @override
  State<LessonDetailsPage> createState() => _LessonDetailsPageState();
}

class _LessonDetailsPageState extends State<LessonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
