import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      height: 180,
      width: 350,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center, // Yatayda ortalama ekleniyor
            text: TextSpan(
              text: "",
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'TOBETO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.purple)),
                TextSpan(
                    text: "'ya hoş geldin ",
                    style: TextStyle(
                      fontSize: 24,
                    )),
                TextSpan(
                    text: nameUser,
                    style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500), // Yatayda ortalama ekleniyor
            ),
          ),
        ],
      ),
    );
  }
}
