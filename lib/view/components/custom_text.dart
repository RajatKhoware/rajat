import 'package:flutter/material.dart';
import 'package:tambola_frontend/view/constants/colors.dart';

class CustomTextStyle extends TextStyle {
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final List<Shadow> shadow;

  const CustomTextStyle({
    this.textColor = textColor1,
    required this.fontWeight,
    this.fontSize = 14,
    this.fontFamily = "Montserrat",
    this.shadow = const [
      Shadow(
        color: primaryColor,
        blurRadius: 2.0,
        offset: Offset(0, 2.0),
      )
    ],
  })  : assert(fontWeight != null),
        super(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            shadows: shadow);
}

class AppTextStyle {
  static TextStyle customizedTextStyle({
    textColor = textColor1,
    fontWeight,
    fontSize = 14,
    fontFamily = "Montserrat",
    shadow = const [
      Shadow(
        color: primaryColor,
        blurRadius: 2.0,
        offset: Offset(0, 2.0),
      )
    ],
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadow);
  }
}
