import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.isPassword,
  });

  final TextEditingController controller;
  final String labelText;
  final Icon icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: icon,
        labelText: labelText,
      ),
    );
  }
}
