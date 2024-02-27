//Header
import 'package:flutter/material.dart';

class PageImageConstants {
  static const String backgorundImage = "assets/png/background.png";
  static const String loginHeaderImage = "assets/png/tobetoDarkModeLogo.png";
  static const String loginHeaderImageDark =
      "assets/png/tobetoLightModeLogo.png";
  static const String surveyImage = "assets/png/surveys.png";
  static const String edubanner = "assets/png/eduBanner.png";
  static const String profileImageDefault = "assets/png/profile_background.png";
  static const String visibilityOn = "assets/png/visibility_on.png";
  static const String visibilityOff = "assets/png/visibility_off.png";
  static const String istanbulCoding = "assets/png/istanbulkodluyor.png";
}

String getLogo(Brightness brightness) {
  return brightness == Brightness.dark
      ? PageImageConstants.loginHeaderImage
      : PageImageConstants.loginHeaderImageDark;
}
