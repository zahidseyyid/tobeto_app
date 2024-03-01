import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';

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
    return Padding(
      padding: paddingOnlyBottomMedium,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: paddingOnlyLeftSmall,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )),
          Expanded(
            flex: 9,
            child: Text(description,
                style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
