import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/components/heading_text.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class HeaderWidget extends StatelessWidget {
  final Gradient gradient1;
  final Gradient gradient2;
  final Gradient gradient3;
  final Gradient gradient4;
  final Gradient gradient5;
  const HeaderWidget({
    Key? key,
    required this.gradient1,
    required this.gradient2,
    required this.gradient3,
    required this.gradient4,
    required this.gradient5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 165.h,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 79, 143),
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ], gradient: newblue2liner),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 33.99.h,
              decoration: BoxDecoration(gradient: greyLinerGradient),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 140.w,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 6.h),
                  //   child: Container(
                  //     height: 19.h,
                  //     width: 21.w,
                  //     decoration:
                  //         const BoxDecoration(gradient: fireLinearGradient),
                  //   ),
                  // ),
                  SizedBox(
                    width: 10.w,
                  ),
                    NewCoustomText2(
                    text: "Bonzo".tr,
                    fontsize: 25.sp,
                    fontFamily: 'IrishGrover',
                    fontWeight: FontWeight.w200,
                    color: newfireliner.colors,
                  ),
                  SizedBox(
                    width: 90.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 10.w),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Container(
                    width: 402.w,
                    height: 3.h,
                    color: fromCssColor('#FFFFFF'),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopSmallCricle(gradient: gradient1),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: TopSmallCricle(gradient: gradient2),
                      ),
                      TopSmallCricle(gradient: gradient3),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: TopSmallCricle(gradient: gradient4),
                      ),
                      TopSmallCricle(gradient: gradient5),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(height: 10.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                'Select Room',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              ),
              Text(
                'Select Match',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              ),
              Text(
                'Add Money',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              ),
              Text(
                'Waiting Money',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              ),
              Text(
                'Play & Win',
                style: TextStyle(color: Colors.white, fontSize: 11.sp),
              )
            ]),
            SizedBox(height: 3.h),
            Divider(
              color: Colors.blue.shade400,
              thickness: 1.5.h,
              height: 6.h,
            ),
            Flexible(child: HeadingText(fontSize: 34.sp)),
          ],
        ),
      ),
    );
  }
}

class TopSmallCricle extends StatelessWidget {
  final Gradient? gradient;
  final Color? color;
  const TopSmallCricle({
    Key? key,
    this.gradient,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color, gradient: gradient),
    );
  }
}
