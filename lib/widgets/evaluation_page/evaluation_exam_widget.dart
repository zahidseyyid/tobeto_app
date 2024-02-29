import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/home_page/startbutton_widget.dart';
import 'package:flutter_application_1/constants/page_constants.dart';

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
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  padding: paddingOnlyRightBig,
                  child: StartButtonWidget(
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
