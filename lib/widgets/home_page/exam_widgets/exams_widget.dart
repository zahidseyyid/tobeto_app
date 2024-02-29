import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exam_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exam_item.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exam_result_dialog.dart';

class ExamsWidget extends StatelessWidget {
  //TODO: Text ve iconlar constant olmalı
  const ExamsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onClick() {
      Navigator.of(context).pop();
      examResultDialogWidget(
          context, correctAnswer, wrongAnswer, emptyAnswer, point);
    }

    return SizedBox(
      //margin: const EdgeInsets.only(bottom: 20),
      width: 500,
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Sınavlarım",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ),
          ExamItem(
            quizTitle: "Herkes için Kodlama 1D Değerlendirme Sınavı",
            description: "Herkes için Kodlama - 1D",
            time: "45 Dakika",
            onTap: () {
              examDialogWidget(
                  context,
                  dialogTitle,
                  dialogText,
                  true,
                  "45 Dakika",
                  25,
                  "Çoktan Seçmeli",
                  "Raporu Görüntüle",
                  onClick);
            },
          ),
        ],
      ),
    );
  }
}
