// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class CashOutCard extends StatefulWidget {
  const CashOutCard({Key? key}) : super(key: key);

  @override
  State<CashOutCard> createState() => _CashOutCardState();
}

class _CashOutCardState extends State<CashOutCard> {
  String amount = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Navigator.pushNamed(context, '/add-money');
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 359.w,
            height: 418.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: newmetalliccard),
            child: Column(children: [
              SizedBox(height: 20.h),
              Container(
                width: 319.w,
                height: 80.h,
                decoration: BoxDecoration(
                    gradient: blueGradient2,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [boxShadowWallet]),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13.h,
                        left: 20.w,
                        right: 10.w,
                      ),
                      child: SizedBox(
                        width: 106.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              NewCoustomText2(
                                text: "Cash Out".tr,
                                fontsize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                              NewCoustomText2(
                                text: "Minimum : ₹50".tr,
                                fontsize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                              NewCoustomText2(
                                text: "Maximum : ₹20000".tr,
                                fontsize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 171.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        gradient: newfireliner,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [boxShadowWallet],
                      ),
                      child: Center(
                        child: Form(
                          key: _formkey,
                          child: Container(
                            width: 158.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: fromCssColor("#D9D9D9"),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SizedBox(
                                width: 129.w,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 13.sp),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: " Enter Amount Here".tr,
                                    labelStyle: TextStyle(
                                      fontSize: 11.sp,
                                      color: fromCssColor("#545050"),
                                    ),
                                    border: InputBorder.none,
                                    errorStyle: TextStyle(fontSize: 12.sp),
                                  ),
                                  onChanged: (value) {
                                    amount = value;
                                    setState(() {});
                                  },
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return "Please Enter the amount".tr;
                                    } else if (value != null &&
                                        (int.parse(value) < 5 ||
                                            int.parse(value) > 20000)) {
                                      return "Please Enter 5 to 20000".tr;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  SizedBox(width: 20.w),
                  SizedBox(
                    width: 200.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: NewCoustomText2(
                        text: "Withdrawal amount".tr,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: newgreytextgradient.colors,
                      ),
                    ),
                  ),
                  SizedBox(width: 60.w),
                  NewCoustomText2(
                    text: "₹100",
                    fontsize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: newgreenliner.colors,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(width: 20.w),
                  NewCoustomText2(
                    text: "Tax @ 15%....".tr,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: newgreytextgradient.colors,
                  ),
                  SizedBox(width: 130.w),
                  NewCoustomText2(
                    text: "₹15",
                    fontsize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: newredliner.colors,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: NewCoustomText2(
                  text: "Total Amount Withdrawal".tr,
                  fontsize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: newblue2liner.colors,
                ),
              ),
              SizedBox(height: 20.h),
              NewCoustomText2(
                text: "₹85",
                fontsize: 20.sp,
                fontWeight: FontWeight.bold,
                color: newgreenliner.colors,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(width: 33.w),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: Container(
                      width: 186.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        gradient: newfireliner,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [boxShadowWallet],
                      ),
                      child: Center(
                        child: NewCoustomText2(
                          text: "CASH OUT".tr,
                          fontsize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: newblue2liner.colors,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/support");
                    },
                    child: Container(
                      width: 86.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        gradient: blueGradient,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [boxShadowWallet],
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/logos/support_icon.png",
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                  ),
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
