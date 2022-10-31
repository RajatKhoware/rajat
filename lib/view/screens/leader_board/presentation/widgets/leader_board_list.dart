import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';


class LB_ListView extends StatelessWidget {
  final String profileImg;
  final String? prizeImg;
  final String text;

  const LB_ListView({
    Key? key,
    required this.profileImg,
    this.prizeImg,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 315.w,
        height: 66.h,
        child: Row(
          children: [
            SizedBox(width: 6.h),
            CircleAvatar(
              radius: 27.r,
              backgroundImage: AssetImage(profileImg),
            ),
            SizedBox(width: 4.h),
            SizedBox(
              width: 170.w,
              height: 65.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                    child: NewCoustomText2(
                      text: "User Name".tr,
                      fontsize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: newblacklinergradient.colors,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: NewCoustomText2(
                              text: "User ID".tr,
                              fontsize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: newtamatoredliner.colors,
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: SizedBox(width: 10.w)),
                        Container(
                          width: 90.w,
                          height: 16.12.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: fromCssColor("#005569"),
                            border:
                                Border.all(color: Colors.white, width: 1.0.w),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0.r),
                            ],
                          ),
                          child: Center(
                            child: NewCoustomText2(
                                text: text,
                                fontsize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              prizeImg.toString(),
              width: 33.w,
              height: 39.11.h,
            )
          ],
        ),
      ),
    );
  }
}

class LB_ListView_2 extends StatelessWidget {
  final String profileImg;

  final String text;

  const LB_ListView_2({
    Key? key,
    required this.profileImg,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 315.w,
        height: 66.h,
        child: Row(
          children: [
            SizedBox(width: 6.h),
            CircleAvatar(
              radius: 27.r,
              backgroundImage: AssetImage(profileImg),
            ),
            SizedBox(width: 4.h),
            SizedBox(
              width: 200.w,
              height: 65.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                    child: NewCoustomText2(
                      text: "User Name".tr,
                      fontsize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: newblacklinergradient.colors,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: NewCoustomText2(
                              text: "User ID".tr,
                              fontsize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: newtamatoredliner.colors,
                            ),
                          ),
                        ),
                        SizedBox(width: 35.w),
                        Container(
                          width: 90.w,
                          height: 16.12.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: fromCssColor("#005569"),
                            border:
                                Border.all(color: Colors.white, width: 1.0.w),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0.r),
                            ],
                          ),
                          child: Center(
                            child: NewCoustomText2(
                                text: text,
                                fontsize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
