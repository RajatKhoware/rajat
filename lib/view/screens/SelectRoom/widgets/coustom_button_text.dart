// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NewCoustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final List<Color> color;
  final Offset? shadowoffset;
  final Color? shawdowcolor;
  final double? shawdowradius;
  final TextOverflow textOverflow;
  const NewCoustomText({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    this.fontFamily,
    required this.color,
    this.textOverflow = TextOverflow.ellipsis,
    this.shadowoffset = const Offset(0.0, 0.0),
    this.shawdowcolor = Colors.transparent,
    this.shawdowradius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GradientText(
              text,
              style: TextStyle(
                fontSize: fontsize.sp,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                overflow: textOverflow,
                shadows: <Shadow>[
                  Shadow(
                    offset: shadowoffset!,
                    blurRadius: shawdowradius!,
                    color: shawdowcolor!,
                  ),
                ],
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              radius: .5.r,
              colors: color,
            ));
  }
}

class NewCoustomText2 extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final List<Color> color;
  final Offset? shadowoffset;
  final Color? shawdowcolor;
  final double? shawdowradius;

  const NewCoustomText2({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    this.fontFamily,
    required this.color,
    this.shadowoffset = const Offset(0.0, 5.0),
    this.shawdowcolor = const Color.fromARGB(57, 0, 0, 0),
    this.shawdowradius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GradientText(
              text,
              style: TextStyle(
                fontSize: fontsize.sp,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                shadows: <Shadow>[
                  Shadow(
                    offset: shadowoffset!,
                    blurRadius: shawdowradius!.r,
                    color: shawdowcolor!,
                  ),
                ],
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              radius: .5.r,
              colors: color,
            ));
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final double width;
  final double width2;
  final double height;
  final double height2;
  final Gradient gradient1;
  final Gradient gradient2;
  final List<Color> color;
  final Offset? shadowoffset;
  final Color? shawdowcolor;
  final double? shawdowradius;
  final Function()? onTap;
  const CustomButton2({
    Key? key,
    this.onTap,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.width,
    required this.width2,
    required this.height,
    required this.height2,
    required this.gradient1,
    required this.gradient2,
    required this.color,
    this.shadowoffset = const Offset(0.0, 3.0),
    this.shawdowcolor = const Color.fromARGB(43, 0, 0, 0),
    this.shawdowradius = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Stack(children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: gradient1, borderRadius: BorderRadius.circular(40.r)),
          child: Center(
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: width2,
                height: height2,
                decoration: BoxDecoration(
                    gradient: gradient2,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                    child: GradientText(
                  text,
                  style: TextStyle(
                    fontSize: fontsize,
                    fontWeight: fontWeight,
                    shadows: <Shadow>[
                      Shadow(
                        offset: shadowoffset!,
                        blurRadius: shawdowradius!,
                        color: shawdowcolor!,
                      ),
                    ],
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: .5,
                  colors: color,
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
