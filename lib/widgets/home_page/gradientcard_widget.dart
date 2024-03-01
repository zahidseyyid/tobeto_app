import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

class GradientCardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtitle2;
  final Color startColor, endColor;
  final bool includeStartButton;
  final VoidCallback? onPressed;

  const GradientCardWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.subtitle2,
    this.onPressed,
    this.includeStartButton = false,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    BorderRadius borderRadius = const BorderRadius.only(
      topRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    );
    return Padding(
      padding: paddingAllSmall,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          width: sizeWidth,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                startColor,
                endColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: paddingAllSuperBig,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w800)),
              ),
              if (subtitle != null)
                Padding(
                  padding: paddingAllSuperBig,
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
              if (subtitle2 != null)
                Padding(
                  padding: paddingOnlyBottomBig,
                  child: Text(subtitle2!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.background)),
                ),
              if (includeStartButton)
                Padding(
                  padding: paddingAllBig,
                  child: CustomButton(
                    buttonText: EvaluationConstants.start,
                    onPressed: onPressed ?? () {},
                    buttonColor: const Color(0xFF9933FF),
                    width: sizeWidth / 3,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
