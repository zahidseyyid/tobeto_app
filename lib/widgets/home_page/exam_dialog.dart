import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';
import 'package:flutter_application_1/widgets/home_page/exam_result_dialog.dart';

void examDialogWidget(BuildContext context, String dialogTitle, String dialogText, String examTime, int numberOfQuestions, String questionType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          color: Colors.white, 
          padding: const EdgeInsets.all(16.0),
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
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Popup'ı kapat
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(dialogText),
              const SizedBox(height: 70),
              Text('Sınav Süresi: $examTime', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('Soru Sayısı: $numberOfQuestions', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('Soru Tipi: $questionType', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: CustomButton(onPressed: () {
                  Navigator.of(context).pop();
                  examResultDialogWidget(context, dialogTitle, dialogText);
                } , buttonText: "Raporu Görüntüle", buttonColor: const Color(0xFF9933FF), buttonTextColor: Colors.white, width: 200 , height: 40)
              ),
            ],
          ),
        ),
      );
    },
  );
}