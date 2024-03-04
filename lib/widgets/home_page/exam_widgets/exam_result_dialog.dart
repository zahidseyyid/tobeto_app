import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

void examResultDialogWidget(BuildContext context, int correctAnswer,
    int wrongAnswer, int emptyAnswer, int point, void Function() onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          padding: paddingAllSuperBig,
          child: Column(
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: Container(
                  alignment: Alignment.center, // Container'ı ortala
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary, // SizedBox'a arkaplan rengi
                    borderRadius:
                        BorderRadius.circular(45), // Add border radius
                  ),
                  child: Text(
                    ExamConstants.examFinish,
                    style: TextStyle(
                      // Text'in metin rengi
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 15.0,
                runSpacing: 15.0,
                children: [
                  _buildCard(
                      correctAnswer, ExamConstants.correctAnswer, context),
                  _buildCard(wrongAnswer, ExamConstants.wrongAnswer, context),
                  _buildCard(emptyAnswer, ExamConstants.emptyAnswer, context),
                  _buildCard(point, ExamConstants.point, context),
                ],
              ),
              const SizedBox(height: 50),
              CustomButton(
                onPressed: onPressed,
                buttonText: WorkExperienceConstants.dialogClose,
                buttonColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCard(int number, String text, BuildContext context) {
  return SizedBox(
    width: 130,
    height: 100,
    child: Card(
      child: Padding(
        padding: paddingAllMedium,
        child: Column(
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(text),
          ],
        ),
      ),
    ),
  );
}
