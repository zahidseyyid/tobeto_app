import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF9933FF),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Image(image: AssetImage(loginHeaderImage), width: 125),
                    const SizedBox(width: 90),
                    CustomButton(onPressed: () {}, buttonText: "Bize Ulaşın" , buttonColor: Colors.white , buttonTextColor: Colors.black, width: 150, height: 35, ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top:16.0),
            child: Text(
                  '© 2022 Tobeto',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
