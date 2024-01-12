import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/home_page/exam_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/exam_item.dart';

class ExamsWidget extends StatelessWidget {
  const ExamsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
              examDialogWidget(context, dialogTitle, dialogText, "45 Dakika",
                  25, "Çoktan Seçmeli");
            },
          ),
        ],
      ),
    );
  }
}
