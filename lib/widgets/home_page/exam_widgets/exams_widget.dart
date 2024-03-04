import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/widgets/home_page/exam_widgets/exam_dialog.dart';
import 'package:tobeto_app/widgets/home_page/exam_widgets/exam_item.dart';
import 'package:tobeto_app/widgets/home_page/exam_widgets/exam_result_dialog.dart';

class ExamsWidget extends StatelessWidget {
  const ExamsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    void onClick() {
      Navigator.of(context).pop();
      examResultDialogWidget(context, 24, 1, 0, 96, () {
        Navigator.of(context).pop();
      });
    }

    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: paddingAllSmall,
            child: const Text(ExamConstants.exams,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ),
          ExamItem(
            quizTitle: ExamConstants.evaluationExam,
            description: ExamConstants.codingForEveryone,
            time: ExamConstants.lessonMinute45,
            onTap: () {
              examDialogWidget(
                  context,
                  ExamResultConstants.dialogTitle,
                  ExamResultConstants.dialogText,
                  true,
                  45,
                  25,
                  EvaluationConstants.viewReport,
                  onClick);
            },
          ),
        ],
      ),
    );
  }
}
