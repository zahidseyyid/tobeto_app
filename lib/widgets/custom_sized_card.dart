import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';

class CustomSizedCardWidget extends StatelessWidget {
  final double? height;
  final double width;
  final Widget? child;
  final String? cardTitleText;
  final String? cardSubText;

  const CustomSizedCardWidget({
    super.key,
    this.height,
    required this.width,
    this.child,
    this.cardTitleText,
    this.cardSubText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width, vertical: width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cardTitleText != null)
                Text(
                  cardTitleText!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              if (cardSubText != null)
                Text(
                  cardSubText!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
