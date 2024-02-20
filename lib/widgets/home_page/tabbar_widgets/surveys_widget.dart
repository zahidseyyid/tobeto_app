import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';

class SurveysWidget extends StatelessWidget {
  final String text;
  const SurveysWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Container(
        width: deviceWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset(PageImageConstants.surveyImage,
                height: deviceHeight / 6),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
