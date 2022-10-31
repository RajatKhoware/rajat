import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomGradientText extends StatelessWidget {
  const CoustomGradientText(
      {required this.text,
      required this.gradient,
      this.style,
      this.textAlign = TextAlign.center,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => gradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width.w, bounds.height.h),
              ),
              child: Text(text, textAlign: textAlign, style: style),
            ));
  }
}

