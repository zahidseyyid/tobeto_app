import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/widgets/home_page/startbutton_widget.dart';
import 'package:tobeto_app/constants/page_constants.dart';

class EvaluationExamWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const EvaluationExamWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: paddingHMedium,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Container(
          height: screenHeight / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFbda6fe),
                Color(0xFF1d0b8c),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: EvaluationConstants.menuIcon,
                onPressed: () {},
              ),
              Expanded(
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ),
              Expanded(
                child: Container(
                  padding: paddingOnlyRightBig,
                  child: StartButtonWidget(
                    textColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
