import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
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
              children: <TextSpan>[
                const TextSpan(
                    text: 'TOBETO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.purple)),
                const TextSpan(
                    text: "'ya hoş geldin\n",
                    style: TextStyle(
                      fontSize: 24,
                    )),
                TextSpan(
                    text: FirebaseAuth.instance.currentUser!.displayName!,
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500), // Yatayda ortalama ekleniyor
            ),
          ),
        ],
      ),
    );
  }
}
