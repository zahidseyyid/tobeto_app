import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

void examResultDialogWidget(
    BuildContext context, String dialogTitle, String dialogText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: Container(
                  alignment: Alignment.center, // Container'ı ortala
                  decoration: BoxDecoration(
                    color: const Color(0xFF9333FF), // SizedBox'a arkaplan rengi
                    borderRadius:
                        BorderRadius.circular(45), // Add border radius
                  ),
                  child: const Text(
                    'Test Bitti',
                    style: TextStyle(
                      // Text'in metin rengi
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 15.0,
                runSpacing: 15.0,
                children: [
                  _buildCard(correctAnswer, 'Doğru'),
                  _buildCard(wrongAnswer, 'Yanlış'),
                  _buildCard(emptyAnswer, 'Boş'),
                  _buildCard(point, 'Puan'),
                ],
              ),
              const SizedBox(height: 50),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: "Kapat",
                  buttonColor: const Color(0xFF9933FF),
                  width: 100,
                  height: 40,
                  buttonTextColor: Colors.white)
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCard(String number, String text) {
  return SizedBox(
    width: 130,
    height: 75,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              number.toString(),
              style: const TextStyle(
                color: Color(0xFF9933FF),
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
