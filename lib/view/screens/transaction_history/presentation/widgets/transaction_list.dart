import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';


class TransationList extends StatelessWidget {
  const TransationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 59.28.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NewCoustomText2(
                      text: "Withdrawal ( Paytm/UPI )".tr,
                      fontsize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: newgreytextgradient.colors,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                NewCoustomText2(
                  text: "-  ₹ 10000",
                  fontsize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: newredliner.colors,
                ),
              ],
            ),
            Expanded(flex: 1, child: SizedBox(height: 5.h)),
            Row(
              children: [
                SizedBox(
                  width: 150.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NewCoustomText2(
                      text: "Room ID/ Transaction ID".tr,
                      fontsize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: newredliner.colors,
                    ),
                  ),
                ),
                SizedBox(width: 80.w),
                SizedBox(
                  width: 75.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NewCoustomText2(
                      text: "Added in Wallet".tr,
                      fontsize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: newgreytextgradient.colors,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Container(
                width: 249.w,
                height: 1.2.h,
                decoration: BoxDecoration(
                  gradient: newblacklinergradient,
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
