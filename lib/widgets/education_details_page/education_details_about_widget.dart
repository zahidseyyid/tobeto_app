import 'package:flutter/material.dart';

class EducationDetailsAboutWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const EducationDetailsAboutWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Icon(icon)),
        Expanded(flex: 3, child: Text(title)),
        Expanded(flex: 10, child: Text(description)),
      ],
    );
  }
}
