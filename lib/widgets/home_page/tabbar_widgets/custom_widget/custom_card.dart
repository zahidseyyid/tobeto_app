import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.width,
    this.child,
  });

  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: Theme.of(context).colorScheme.onError,
            shape: BoxShape.rectangle),
        //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: child,
      ),
    );
  }
}
