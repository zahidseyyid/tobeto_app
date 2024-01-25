import 'package:flutter/material.dart';

class StartButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? buttonWidth;
  const StartButtonWidget({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.buttonWidth,
  }) : super(key: key);

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonWidth,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "Başla",
          style: TextStyle(
            fontSize: 16,
            color: widget.textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
