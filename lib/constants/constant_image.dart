//Header
import 'package:flutter/material.dart';

class PageImageConstants {
  static const String backgorundImage = "lib/assets/background.png";
  static const String loginHeaderImage = "lib/assets/tobetoDarkModeLogo.png";
  static const String loginHeaderImageDark =
      "lib/assets/tobetoLightModeLogo.png";
  static const String surveyImage = "lib/assets/surveys.png";
  static const String edubanner = "lib/assets/eduBanner.png";
  static const String profileImageDefault = "lib/assets/profile_background.png";
  static const String visibilityOn = "lib/assets/visibility_on.png";
  static const String visibilityOff = "lib/assets/visibility_off.png";
}

String getLogo(Brightness brightness) {
  return brightness == Brightness.dark
      ? PageImageConstants.loginHeaderImage
      : PageImageConstants.loginHeaderImageDark;
}
