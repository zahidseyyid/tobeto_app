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
        Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )),
        Expanded(
          flex: 9,
          child: Text(description, style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}
