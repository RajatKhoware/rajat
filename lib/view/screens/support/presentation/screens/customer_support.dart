import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/account_header.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

import 'customer_support_3.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            SizedBox(
              width: 428.w,
              height: 713.h,
              child: Column(children: [
                SizedBox(height: 130.h),
                NewCoustomText(
                    text: "Select the Support Type".tr,
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: newblue2liner.colors),
                SizedBox(height: 40.h),
                Container(
                    width: 368.w,
                    height: 372.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                      boxShadow: [boxShadowCoustomer],
                      border: Border.all(
                        width: 3.w,
                        color: Color.fromARGB(255, 1, 36, 65),
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 300.w,
                        height: 285.h,
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CustomerSupport3())));
                            },
                            child: NewCoustomText2(
                              text: "Game play".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 45.h),
                          Container(
                            width: 300.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              gradient: newblue2liner,
                              boxShadow: [boxShadowCoustomer],
                            ),
                          ),
                          SizedBox(height: 45.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CustomerSupport3())));
                            },
                            child: NewCoustomText2(
                              text: "Deposit".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 45.h),
                          Container(
                            width: 300.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              gradient: newblue2liner,
                              boxShadow: [boxShadowCoustomer],
                            ),
                          ),
                          SizedBox(height: 45.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CustomerSupport3())));
                            },
                            child: NewCoustomText2(
                              text: "Withdrawal".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                        ]),
                      ),
                    ))
              ]),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
