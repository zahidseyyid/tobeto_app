import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';

class EduBannerWidget extends StatelessWidget {
  const EduBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              edubanner,
              width: deviceWidth,
              height: deviceHeight / 4.5,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: deviceHeight / 10,
            left: 20,
            child: const Text(
              'Eğitimlerim',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}