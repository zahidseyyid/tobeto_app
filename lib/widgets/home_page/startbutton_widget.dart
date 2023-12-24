import 'package:flutter/material.dart';

class StartButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const StartButtonWidget({super.key, required this.onPressed});

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text("Başla"),
    );
  }
}
