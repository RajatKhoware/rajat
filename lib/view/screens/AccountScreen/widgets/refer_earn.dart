import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class ReferContainer extends StatelessWidget {
  const ReferContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 428.w,
              height: 144.h,
              decoration: BoxDecoration(
                gradient: blueGradient,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(209, 81, 92, 104),
                    offset: Offset(0.0, 7.0),
                    blurRadius: 4.0.r,
                  ),
                ],
              ),
              child: SizedBox(
                width: 428.w,
                height: 144.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            NewCoustomText(
                              text: "REFER & EARN".tr,
                              fontsize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: [
                                fromCssColor('#FFFFFF'),
                                fromCssColor('#FFFFFF')
                              ],
                              shadowoffset: Offset(4.0, 6.0),
                              shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                              shawdowradius: 10.0.r,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 428.w,
                        height: 96.h,
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 25.w),
                                child: NewCoustomText(
                                  text:
                                      "Refer a Friend and GET\n When they play or add \n      money in wallet"
                                          .tr,
                                  fontsize: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .fontSize!,
                                  fontWeight: FontWeight.bold,
                                  color: [
                                    fromCssColor('#FFFFFF'),
                                    fromCssColor('#FFFFFF')
                                  ],
                                  shadowoffset: Offset(4.0, 6.0),
                                  shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                                  shawdowradius: 10.0.r,
                                )),
                            SizedBox(
                              width: 15.w,
                            ),
                            NewCoustomText(
                              text: "₹ 10",
                              fontsize: 35.sp,
                              fontWeight: FontWeight.bold,
                              color: newfireliner.colors,
                              shadowoffset: Offset(4.0, 6.0),
                              shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                              shawdowradius: 10.0.r,
                            ),
                            Image.asset(
                              'assets/images/coins.png',
                              width: 95.w,
                              height: 131.h,
                              scale: 0.1,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
