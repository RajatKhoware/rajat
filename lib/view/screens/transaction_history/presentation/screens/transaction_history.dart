import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/view/screens/WalletCard/wallet_card.dart';

import '../widgets/transaction_list.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 339.w,
            height: 552.h,
            decoration: BoxDecoration(
              gradient: newblue2liner,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(children: [
              SizedBox(height: 5.h),
              SizedBox(
                width: 320.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText2(
                    text: "Transaction History".tr,
                    fontsize: 25.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    color: newfireliner.colors,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 329.w,
                height: 373.h,
                decoration: BoxDecoration(
                  gradient: newmetalliccard,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.only(left: 20.w, top: 10.h),
                      children: [
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                        TransationList(),
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SizedBox(width: 50.w),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/select-room');
                    },
                    child: CustomButton2(
                        text: "Play".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 115.w,
                        width2: 95.w,
                        height: 47.h,
                        height2: 35.h,
                        gradient1: newblacklinergradient,
                        gradient2: newfireliner,
                        color: newblacklinergradient.colors),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) => NewWallet());
                    },
                    child: CustomButton2(
                        text: "Wallet".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 115.w,
                        width2: 95.w,
                        height: 47.h,
                        height2: 35.h,
                        gradient1: newblacklinergradient,
                        gradient2: newfireliner,
                        color: newblacklinergradient.colors),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 50.w),
                  CustomButton2(
                      text: "Share".tr,
                      fontsize: 23.sp,
                      fontWeight: FontWeight.bold,
                      width: 115.w,
                      width2: 95.w,
                      height: 47.h,
                      height2: 35.h,
                      gradient1: newblacklinergradient,
                      gradient2: newfireliner,
                      color: newblacklinergradient.colors),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/support");
                    },
                    child: CustomButton2(
                        text: "Support".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 115.w,
                        width2: 95.w,
                        height: 47.h,
                        height2: 35.h,
                        gradient1: newblacklinergradient,
                        gradient2: newfireliner,
                        color: newblacklinergradient.colors),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
