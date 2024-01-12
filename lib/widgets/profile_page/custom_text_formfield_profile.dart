import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? obscureText;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.focusNode,
    this.maxLines,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .secondary // Odaklandığında çerçeve rengi
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primary, // Odaklanmadığında çerçeve rengi
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
    );
  }
}
