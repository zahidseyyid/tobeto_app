import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(profileImageDefault),
      backgroundColor: Colors.transparent,
    );
  }
}
