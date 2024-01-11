import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';

class EduBannerWidget extends StatelessWidget {
  const EduBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              edubanner,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
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
