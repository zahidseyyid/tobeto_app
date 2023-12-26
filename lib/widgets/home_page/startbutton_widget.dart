import 'package:flutter/material.dart';

class StartButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const StartButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9933FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Başla",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
