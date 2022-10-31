import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class Ellipse extends StatelessWidget {
  const Ellipse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    width: 145.w,
                    height: 142.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: newfireliner,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 102, 120, 139),
                          offset: Offset(0.0, 6.0),
                          blurRadius: 6.0.r,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/avb.png',
                      width: 136.w,
                      height: 134.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child:
                      Consumer<UserProvider>(builder: (context, userState, _) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NewCoustomText(
                            text:
                                userState.user.user.username ?? "User Name".tr,
                            fontsize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize!,
                            fontWeight: FontWeight.bold,
                            color: [
                              fromCssColor('#555555'),
                              fromCssColor('#555555')
                            ],
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                          const SizedBox(height: 10),
                          NewCoustomText(
                            textOverflow: TextOverflow.fade,
                            text: userState.user.user.id ?? "User ID".tr,
                            fontsize: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .fontSize!,
                            fontWeight: FontWeight.bold,
                            color: newtamatoredliner.colors,
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                        ]);
                  }),
                )
              ],
            ));
  }
}
