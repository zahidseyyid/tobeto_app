import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';

class HeaderWidget extends StatefulWidget {
  final String name;
  const HeaderWidget({super.key, required this.name});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingOnlyTopSuperBig,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center, // Yatayda ortalama ekleniyor
            text: TextSpan(
              text: "",
              style: Theme.of(context).textTheme.titleMedium,
              children: <TextSpan>[
                TextSpan(
                    text: HeaderConstants.tobeto,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.secondary)),
                TextSpan(
                    text: HeaderConstants.welcome,
                    style: Theme.of(context).textTheme.headlineSmall),
                TextSpan(
                    text: widget.name,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          Padding(
            padding: paddingOnlyTopSuperBig + paddingOnlyBottomSuperBig,
            child: const Text(
              HeaderConstants.newGenerationLearningExperience,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
