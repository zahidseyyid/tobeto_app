//Header
import 'package:flutter/material.dart';

const loginHeaderImage = "lib/assets/tobetoDarkModeLogo.png";
const loginHeaderImageDark = "lib/assets/tobetoLightModeLogo.png";
const backgorundImage = "lib/assets/background.png";

String getLogo(Brightness brightness) {
    return brightness == Brightness.dark ? loginHeaderImage : loginHeaderImageDark;
}