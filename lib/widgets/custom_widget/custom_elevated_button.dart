import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Padding(
      padding: paddingHMedium,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                buttonColor ?? Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  fontSize: deviceWidth / 25,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onError))),
    );
  }
}
