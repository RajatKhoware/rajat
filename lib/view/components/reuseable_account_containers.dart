// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

//This resueable container are for small circle with days name !
//THis one is for golden circles.
class ReuseAbleContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Gradient? gradient;
  const ReuseAbleContainer({
    Key? key,
    required this.text,
    required this.color,
    this.gradient = fireLinearGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 38.w,
              height: 38.63.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, gradient: gradient),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(123, 51, 51, 51),
                        ),
                      ],
                      color: color),
                ),
              ),
            ));
  }
}

//This resueable container are for Circular Buttons !.
class ReuseAbleCircularButtons extends StatelessWidget {
  final VoidCallback ontap;
  final Icon icon;

  const ReuseAbleCircularButtons({
    Key? key,
    required this.ontap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 65.w,
              height: 68.44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: fireLinearGradient,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(211, 64, 65, 66),
                    offset: Offset(0.0, 7.0),
                    blurRadius: 4.0.r,
                  ),
                ],
              ),
              child: Center(
                  child: IconButton(
                onPressed: ontap,
                icon: icon,
                iconSize: 45.sp,
                color: fromCssColor('#FFFFFF'),
              )),
            ));
  }
}

//This reuseablecontainer are for colunm view.
class ReuseableGradientContainer extends StatelessWidget {
  final double width;
  final double height;
  final String text1;
  final String text2;
  const ReuseableGradientContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.text1,
    required this.text2,
    required int fontsize,
    required int circular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: width.w,
              height: height.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: blueGradient,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(193, 102, 120, 139),
                    offset: Offset(0.0, 7.0),
                    blurRadius: 4.0.r,
                  ),
                ],
              ),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(top: 7.h, bottom: 9.h),
                    child: NewCoustomText(
                      text: text1,
                      fontsize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: [
                        fromCssColor("#FFFFFF"),
                        fromCssColor("#FFFFFF"),
                      ],
                      shadowoffset: Offset(4.0, 4.0),
                      shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                      shawdowradius: 10.0.r,
                    ),),
                Container(
                  width: 147.w,
                  height: 35.65.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: fromCssColor('#FFFFFF').withOpacity(0.5)),
                  child: Center(
                      child: NewCoustomText(
                    text: text2,
                    fontsize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: newblue2liner.colors,
                    shadowoffset: Offset(4.0, 4.0),
                    shawdowcolor: Color.fromARGB(90, 51, 51, 51),
                    shawdowradius: 10.0.r,
                  )),
                )
              ]),
            ));
  }
}

//This reuseablecontainer are for row view.
class ReuseableGradientContainer2 extends StatelessWidget {
  final double width;
  final double height;
  final String text1;
  final String text2;
  const ReuseableGradientContainer2({
    Key? key,
    required this.width,
    required this.height,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: width.w,
              height: height.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 102, 120, 139),
                    offset: Offset(0.0, 6.0),
                    blurRadius: 6.0.r,
                  ),
                ],
                borderRadius: BorderRadius.circular(20.r),
                gradient: blueGradient2,
              ),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                    child: NewCoustomText(
                      text: text1,
                      fontsize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: [
                        fromCssColor("#FFFFFF"),
                        fromCssColor("#FFFFFF"),
                      ],
                      shadowoffset: Offset(4.0, 4.0),
                      shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                      shawdowradius: 10.0.r,
                    )),
                Container(
                  width: 160.w,
                  height: 41.65.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: fromCssColor('#FFFFFF').withOpacity(0.6)),
                  child: Center(
                      child: NewCoustomText(
                    text: text2,
                    fontsize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: newblue2liner.colors,
                    shadowoffset: Offset(4.0, 4.0),
                    shawdowcolor: Color.fromARGB(85, 51, 51, 51),
                    shawdowradius: 10.0.r,
                  )),
                )
              ]),
            ));
  }
}
