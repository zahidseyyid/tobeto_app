import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';

class CustomProfileSizedBox extends StatelessWidget {
  const CustomProfileSizedBox({
    super.key,
    required this.deviceWidth,
    required this.title,
    required this.infoText,
    required this.icon,
  });

  final double deviceWidth;
  final String title;
  final String infoText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth / 1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onError,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 30),
          ),
          Padding(
            padding: paddingHMedium,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
              ),
              Text(
                infoText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
