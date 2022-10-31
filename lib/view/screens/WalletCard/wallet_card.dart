// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/controller/providers/wallet_provider.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/view/screens/WalletCard/add_money/presentation/screens/add_money_card.dart';
import 'package:tambola_frontend/view/screens/WalletCard/cash_out/presentation/screens/cash__out_card.dart';
import 'package:tambola_frontend/view/screens/support/presentation/screens/customer_support.dart';
import 'package:tambola_frontend/view/screens/transaction_history/presentation/screens/transaction_history.dart';

class NewWallet extends StatelessWidget {
  const NewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<WalletProvider>(context, listen: false).getWalletState();
    });
    return ScreenUtilInit(
      builder: (context, child) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 359.w,
            // height: 680.h,
            decoration: BoxDecoration(
                gradient: newmetallicGradient,
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 22.w, right: 22.w, top: 20.h, bottom: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User Details
                    Consumer<UserProvider>(builder: (context, userState, _) {
                      return ProfileInfoWalletScreen(
                        userId: userState.user.user.id ?? "USER ID",
                        userName: userState.user.user.username ?? "USER NAME",
                      );
                    }),

                    // First colunm TOAL BALANCE AVAILABLE
                    Consumer<WalletProvider>(
                        builder: (context, walletState, _) {
                      return TotalBalWalletScreen(
                        title: "WINNING AMOUNT".tr,
                        totalBal: walletState.walletState.totalUsableAmount!
                            .toStringAsFixed(1),
                      );
                    }),
                    Consumer<WalletProvider>(
                        builder: (context, walletState, _) {
                      return Column(
                        children: [
                          TotalBalWalletScreen(
                            title: "TOTAL BALANCE".tr,
                            totalBal: walletState.walletState.defaultAmount!
                                .toStringAsFixed(1),
                          ),

                          // Second Colunm Entry fee
                          Container(
                            width: 319.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              boxShadow: [boxShadowWallet],
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: newRadial_r_1_5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: NewCoustomText2(
                                    text: "Entry Fees".tr,
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: newgreygradient.colors,
                                  ),
                                ),
                                Container(
                                  // width: 153.w,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  height: 41.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    gradient: newfireliner,
                                    boxShadow: [boxShadowWallet],
                                  ),
                                  child: Center(
                                    child: NewCoustomText2(
                                      text: "Pay        ₹ 50".tr,
                                      fontsize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newgreygradient.colors,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),

                    // Third and fourth Colunm Add Money And Cash Out

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(width: 3.w),
                        PaymentButton(
                            label: "  Add\nMoney".tr,
                            onTap: () async {
                              showDialog(
                                  useSafeArea: false,
                                  context: context,
                                  builder: (context) => AddMoneyCard());
                              // walletPicker(context);
                              // await PaymentSystem().payment();
                            }),
                        // SizedBox(width: 50.w),
                        PaymentButton(
                          label: "Cash\n  Out".tr,
                          type: "-",
                          onTap: () async {
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) => CashOutCard());
                          },
                        ),
                      ],
                    ),
                    // Fifth Colunm Check History
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (context) => TransactionHistory());
                        },
                        child: Container(
                          width: 300.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            gradient: newRadial_r_1_5,
                            boxShadow: [boxShadowWallet],
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Check History".tr,
                                fontsize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Sixth Colunm Support
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (context) => CustomerSupport());
                        },
                        child: Container(
                          width: 300.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            gradient: newRadial_r_1_5,
                            boxShadow: [boxShadowWallet],
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Coustom Support".tr,
                                fontsize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: newmetallicGradient.colors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key, this.onTap, this.type = "+", this.label = ""})
      : super(
          key: key,
        );
  final VoidCallback? onTap;
  final String type;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 131.w,
        height: 135.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: RadialGradient(
            colors: [
              fromCssColor('#3DCCFE'),
              fromCssColor('#006177'),
            ],
            radius: .5,
          ),
          boxShadow: [boxShadowWallet],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 35.w),
                NewCoustomText(
                  text: type,
                  fontsize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: newgreygradient.colors,
                  shadowoffset: Offset(4.0, 4.0),
                  shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                  shawdowradius: 10.0.r,
                ),
                Image.asset(
                  "assets/images/coins.png",
                  width: 60.w,
                  height: 60.h,
                ),
              ],
            ),
            NewCoustomText(
              text: label,
              fontsize: 20.sp,
              fontWeight: FontWeight.bold,
              color: newgreygradient.colors,
              shadowoffset: Offset(4.0, 4.0),
              shawdowcolor: Color.fromARGB(123, 51, 51, 51),
              shawdowradius: 10.0.r,
            ),
          ],
        ),
      ),
    );
  }
}

class TotalBalWalletScreen extends StatelessWidget {
  const TotalBalWalletScreen({
    this.totalBal = "",
    this.title = "",
    Key? key,
  }) : super(key: key);
  final String totalBal;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: newRadial_r_1_5,
          boxShadow: [boxShadowWallet]),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          NewCoustomText(
            text: title,
            fontsize: 15.sp,
            fontWeight: FontWeight.bold,
            color: newgreygradient.colors,
            shadowoffset: Offset(4.0, 4.0),
            shawdowcolor: Color.fromARGB(123, 51, 51, 51),
            shawdowradius: 10.0.r,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 163.w,
            height: 41.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: fromCssColor('#FFFFFF').withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(64, 179, 177, 177).withOpacity(0.2),
                  offset: const Offset(0.0, 6.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Center(
              child: NewCoustomText(
                text: "₹ ${totalBal}",
                fontsize: 15.sp,
                fontWeight: FontWeight.bold,
                color: newgreygradient.colors,
                shadowoffset: Offset(4.0, 4.0),
                shawdowcolor: Color.fromARGB(123, 51, 51, 51),
                shawdowradius: 10.0.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoWalletScreen extends StatelessWidget {
  const ProfileInfoWalletScreen(
      {Key? key, this.userId = "", this.userName = ""})
      : super(key: key);
  final String userName;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: Image.asset(
            'assets/images/avg.png',
            width: 120.w,
            height: 120.h,
          ),
        ),
        SizedBox(width: 55.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NewCoustomText(
            text: userName,
            fontsize: 22.sp,
            fontWeight: FontWeight.bold,
            color: newblacklinergradient.colors,
            shadowoffset: Offset(4.0, 4.0),
            shawdowcolor: Color.fromARGB(123, 51, 51, 51),
            shawdowradius: 10.0.r,
          ),
          SizedBox(height: 10.h),
          NewCoustomText(
            text: userId,
            fontsize: Theme.of(context).textTheme.labelSmall!.fontSize!,
            fontWeight: FontWeight.bold,
            color: newredliner.colors,
            shadowoffset: Offset(4.0, 4.0),
            shawdowcolor: Color.fromARGB(123, 65, 64, 64),
            shawdowradius: 8.0.r,
          ),
        ]),
      ],
    );
  }
}
