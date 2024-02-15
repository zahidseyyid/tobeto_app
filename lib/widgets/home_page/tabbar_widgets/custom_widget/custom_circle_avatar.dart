import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(image),
      backgroundColor: Colors.transparent,
    );
  }
}
