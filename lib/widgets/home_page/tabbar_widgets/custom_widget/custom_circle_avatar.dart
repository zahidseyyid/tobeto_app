import 'dart:io';

import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final File pickedImage;
  final String userPhotoUrl;
  final String defaultPhotoUrl =
      "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png";
  const CustomCircleAvatar({
    Key? key, // key parametresini burada düzelttik
    required this.pickedImage,
    required this.userPhotoUrl,
    required this.radius,
  }) : super(key: key); // super(key: key) ifadesini ekledik

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage:
          getImageProvider(pickedImage, userPhotoUrl, defaultPhotoUrl),
      backgroundColor: Colors.transparent,
    );
  }
}

ImageProvider getImageProvider(File image, String url, String defaultUrl) {
  if (image.path != "") {
    return FileImage(image);
  } else {
    if (url != "") {
      return NetworkImage(url);
    }
    return NetworkImage(defaultUrl);
  }
}
