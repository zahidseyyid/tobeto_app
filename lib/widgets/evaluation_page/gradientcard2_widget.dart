import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/home_page/startbutton_widget.dart';

class GradientCardWidget2 extends StatelessWidget {
  final String buttonText;

  final VoidCallback onPressed;

  const GradientCardWidget2({
    Key? key,
    required this.buttonText,
    required this.onPressed,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Container(
          height: 60,
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
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: StartButtonWidget(
                    onPressed: onPressed,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    buttonWidth: 80,
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
