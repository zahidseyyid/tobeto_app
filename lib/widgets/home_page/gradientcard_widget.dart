import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/startbutton_widget.dart';

class GradientCardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtitle2;
  final LinearGradient gradient;
  final bool includeStartButton;
  final bool showArrowIcon;
  final VoidCallback onPressed;
  final double? cardHeight;
  const GradientCardWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.subtitle2,
    required this.gradient,
    required this.onPressed,
    this.includeStartButton = true,
    this.showArrowIcon = false,
    this.cardHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Container(
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: gradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              if (subtitle2 != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    subtitle2!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              if (showArrowIcon)
                const Text(
                  ">>>",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              if (includeStartButton)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: StartButtonWidget(
                    onPressed: onPressed,
                    backgroundColor: const Color(0xFF9933FF),
                    textColor: Colors.white,
                    buttonWidth: 340,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
