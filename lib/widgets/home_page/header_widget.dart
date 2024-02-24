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
    //mainmain();
    return Padding(
      padding: paddingOnlyTopSuperBig,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center, // Yatayda ortalama ekleniyor
            text: TextSpan(
              text: "",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                const TextSpan(
                    text: HeaderConstants.tobeto,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.purple)),
                const TextSpan(
                    text: HeaderConstants.welcome,
                    style: TextStyle(
                      fontSize: 24,
                    )),
                TextSpan(
                    text: widget.name, style: const TextStyle(fontSize: 24)),
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
