import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import '../../../components/reuseable_account_containers.dart';

class AccountColunm1 extends StatelessWidget {
  const AccountColunm1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 428.w,
              height: 173.h,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(172, 102, 120, 139),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 4.0,
                      spreadRadius: 2.0),
                ],
                gradient: RadialGradient(
                  colors: [
                    fromCssColor('#3DCCFE'),
                    fromCssColor('#006177'),
                  ],
                  radius: 0.9,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 11.h, right: 20.w),
                                child: NewCoustomText(
                                  text: "STREAK & EARN".tr,
                                  fontsize: 21.sp,
                                  fontWeight: FontWeight.bold,
                                  color: newgreygradient.colors,
                                  shadowoffset: Offset(4.0, 4.0),
                                  shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                                  shawdowradius: 10.r,
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                                child: NewCoustomText(
                                  text: "Maintain Streak for 30 Days GET".tr,
                                  fontsize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: newgreygradient.colors,
                                  shadowoffset: Offset(4.0, 4.0),
                                  shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                                  shawdowradius: 10.r,
                                )),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 7),
                            child: NewCoustomText(
                              text: "₹ 50",
                              fontsize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: newfireliner.colors,
                              shadowoffset: Offset(4.0, 4.0),
                              shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                              shawdowradius: 10.r,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          'assets/images/coins.png',
                          width: 70.w,
                          height: 82.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
                      child: Row(
                        children: [
                          ReuseAbleContainer(
                            text: "MO",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          SizedBox(width: 13.w),
                          ReuseAbleContainer(
                            text: "TU",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          SizedBox(width: 13.w),
                          ReuseAbleContainer(
                            text: "WED",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          SizedBox(width: 13.w),
                          Padding(
                            padding: EdgeInsets.only(bottom: 13.h),
                            child: Image.asset(
                              'assets/images/Thursaday.png',
                              height: 56.40.h,
                              width: 40.w,
                            ),
                          ),
                          SizedBox(width: 13.w),
                          ReuseAbleContainer(
                            text: "FR",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                          SizedBox(width: 13.w),
                          ReuseAbleContainer(
                            text: "SA",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                          SizedBox(width: 13.w),
                          ReuseAbleContainer(
                            text: "SU",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                        ],
                      ),
                    )
                  ]),
            ));
  }
}

class AccountColunm2 extends StatelessWidget {
  const AccountColunm2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => SizedBox(
              width: 428.w,
              height: 177.44.h,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 5.w, top: 15.h, bottom: 15.h, right: 5.w),
                child: Center(
                  child: SizedBox(
                    width: 359.w,
                    height: 149.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 167.w,
                                  height: 77.2.h,
                                  child: ReuseableGradientContainer(
                                    width: 145.w,
                                    height: 63.2.h,
                                    text1: "TOTAL MATCH".tr,
                                    text2: "555",
                                    fontsize: 20,
                                    circular: 20,
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                SizedBox(
                                  width: 167.w,
                                  height: 77.2.h,
                                  child: ReuseableGradientContainer(
                                    width: 145.w,
                                    height: 63.2.h,
                                    text1: "TOTAL WINNINGS".tr,
                                    text2: "44",
                                    circular: 20,
                                    fontsize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h),
                          SizedBox(
                            width: 359.w,
                            height: 56.h,
                            child: ReuseableGradientContainer2(
                              width: 303.w,
                              height: 50.2.h,
                              text1: "TOTAL AMOUNT WON".tr,
                              text2: "₹ 15000",
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ));
  }
}
