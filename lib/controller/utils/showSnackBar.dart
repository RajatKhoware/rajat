import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/controller/services/payment_service.dart';
import 'package:tambola_frontend/view/components/custom_text.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';

import '../../view/constants/new_gradints.dart';

void showSnackBarText(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<void> walletPicker(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          // alignment: Alignment.bottomCenter,
          title: const Text('select your choice'),
          contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 5.0, 16.0),
          children: [
            SelectWalletPay(
              amount: "10",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "10", context: context);
              },
            ),
            // kHeight1,
            SelectWalletPay(
              amount: "20",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "20", context: context);
              },
            ),
            SelectWalletPay(
              amount: "30",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "30", context: context);
              },
            ),
            SelectWalletPay(
              amount: "50",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "50", context: context);
              },
            ),
            SelectWalletPay(
              amount: "100",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "100", context: context);
              },
            ),
            SelectWalletPay(
              amount: "500",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "500", context: context);
              },
            ),
            SelectWalletPay(
              amount: "1000",
              onTap: () async {
                await PaymentSystem()
                    .makePayment(amount: "1000", context: context);
              },
            ),
          ],
        );
      });
}

class SelectWalletPay extends StatelessWidget {
  const SelectWalletPay({Key? key, this.amount = "0", this.onTap})
      : super(key: key);
  final String amount;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          TextButton.icon(
            icon: const CircleAvatar(
              // backgroundColor: kRed,
              child: CircleAvatar(
                foregroundImage: AssetImage("assets/images/coin-big.png"),
                backgroundColor: Colors.white,
              ),
            ),
            label: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoustomGradientText(
                  text: "₹ $amount",
                  gradient: newfireliner,
                  style: CustomTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      fontFamily: 'Inter'),
                ),
                // SizedBox(
                //   width: 10.h,
                // ),
                // const Text(
                //   "₹ 10",
                // ),
              ],
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
