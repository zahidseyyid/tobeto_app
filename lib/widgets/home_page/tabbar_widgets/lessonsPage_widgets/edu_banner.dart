import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/constant_padding.dart';

class EduBannerWidget extends StatelessWidget {
  const EduBannerWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: paddingAllMedium,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              PageImageConstants.edubanner,
              width: deviceWidth,
              height: deviceHeight / 4.5,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: deviceHeight / 10,
            left: 20,
            child: Text(
              title,
              style: const TextStyle(
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
