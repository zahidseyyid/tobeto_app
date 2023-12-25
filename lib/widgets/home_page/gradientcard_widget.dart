import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/startbutton_widget.dart';

class GradientCardWidget extends StatelessWidget {
  final String buttonText;
  final LinearGradient gradient;

  const GradientCardWidget({
    Key? key,
    required this.buttonText,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: gradient,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            StartButtonWidget(
              onPressed: () {
                print("string1");
              },
            )
          ],
        ),
      ),
    );
  }
}
