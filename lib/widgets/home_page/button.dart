import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final double height;
  final Color buttonColor;
  final Color buttonTextColor;
  const CustomButton({Key? key, required this.onPressed , required this.buttonText , required this.buttonColor, required this.width, required this.height, required this.buttonTextColor})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width, //150
      height: widget.height,  //35
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: widget.buttonTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
