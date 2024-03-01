import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

void examDialogWidget(
  //TODO: Text ve iconlar constant olmalı
  BuildContext context,
  String dialogTitle,
  String dialogText,
  bool isExam,
  String? examTime,
  int? numberOfQuestions,
  String? questionType,
  String buttonText,
  Function() onPressed,
) {
  showDialog(
    //TODO : Diaglo custom widget haline getirilecek. Diğer ekranlarda kullanılabilecek.
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          padding: const EdgeInsets.all(16.0),
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
                      icon: const Icon(Icons.close),
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
                    Text('Sınav Süresi: $examTime',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Soru Sayısı: $numberOfQuestions',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Soru Tipi: $questionType',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      onPressed: onPressed,
                      buttonText: buttonText,
                      buttonColor: const Color(0xFF9933FF),
                      buttonTextColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      );
    },
  );
}
