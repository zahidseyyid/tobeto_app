import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/startbutton_widget.dart';

class GradientCardWidget extends StatelessWidget {
  const GradientCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          gradient: LinearGradient(
            begin: Alignment(0.5, -1.0),
            end: Alignment(0.5, 1.0),
            colors: [
              Color(0xFF1D0B8C),
              Color(0xFFBDA6FE),
            ],
            stops: [0.1357, 0.9838],
            transform: GradientRotation(209.21 * 3.14159 / 180.0),
          ),
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Profilini oluştur',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            StartButtonWidget(
              onPressed: () {
                print("string");
              },
            )
          ],
        ),
      ),
    );
  }
}
