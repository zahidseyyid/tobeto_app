import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

class FooterWidget extends StatelessWidget {
  //TODO: Text ve iconlar constant olmalı
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        color: const Color(0xFF9933FF),
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: const AssetImage(
                              PageImageConstants.loginHeaderImage),
                          width: deviceWidth / 3.5),
                      CustomButton(
                        onPressed: () {},
                        buttonText: "Bize Ulaşın",
                        buttonColor: Colors.white,
                        buttonTextColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
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
      ),
    );
  }
}
