import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/widgets/home_page/button.dart';

void examDialogWidget(
  BuildContext context,
  String dialogTitle,
  String dialogText,
  bool isExam,
  int? examTime,
  int? numberOfQuestions,
  String buttonText,
  Function() onPressed,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          padding: paddingAllBig,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        dialogTitle,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: LessonConstants.closeIcon,
                      onPressed: () {
                        Navigator.of(context).pop(); // Popup'ı kapat
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(dialogText),
                    const SizedBox(height: 70),
                    Text(
                        "${ExamConstants.examTime}$examTime ${ExamConstants.lessonMinute}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('${ExamConstants.questionItem}$numberOfQuestions',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text(
                        '${ExamConstants.examType}${ExamConstants.multibleChoice}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(padding: paddingMedium)
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      onPressed: onPressed,
                      buttonText: buttonText,
                      buttonColor: Theme.of(context).colorScheme.secondary,
                      buttonTextColor: Theme.of(context).colorScheme.background,
                    )),
              ],
            ),
          ),
        ),
      );
    },
  );
}
