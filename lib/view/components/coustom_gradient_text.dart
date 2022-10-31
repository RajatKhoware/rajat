// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CoustomGradintText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontweight;
  final String firstgradientcolor;
  final String secondgradientcolor;
  final String fontfamily;
  const CoustomGradintText({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontweight,
    required this.firstgradientcolor,
    required this.secondgradientcolor,
     this.fontfamily = "Montserrat",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: TextStyle(fontSize: fontsize, fontWeight: fontweight, fontFamily: fontfamily),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: .5,
      colors: [
        fromCssColor(firstgradientcolor),
        fromCssColor(secondgradientcolor),
      ],
    );
  }
}
