import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/wallet_provider.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/components/coustom_gradient_text.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';

class HeadingText extends StatelessWidget {
  final double fontSize;
  final Gradient textGradient;
  final bool isVisible;
  const HeadingText({
    this.fontSize = 34.0,
    this.textGradient = fireLinearGradient,
    this.isVisible = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        height: 45.8.h,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustomGradientText(
                  text: "Tambola",
                  gradient: textGradient,
                  style: TextStyle(
                    fontFamily: 'IrishGrover',
                    fontSize: fontSize.sp,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(left: 23.w),
                  width: 70.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                    gradient: LinearGradient(
                      colors: [
                        fromCssColor('#FFFFFF').withOpacity(0.5),
                        fromCssColor('#E7E7E7').withOpacity(0.5),
                        fromCssColor('#CACACA').withOpacity(0.5),
                        fromCssColor('#C0C0C0').withOpacity(0.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Image.asset('assets/images/coin.png'),
                      ),
                      Consumer<WalletProvider>(
                          builder: (context, walletState, _) {
                        return CoustomGradintText(
                            text: walletState.walletState.totalUsableAmount!
                                .toStringAsFixed(2),
                            fontsize: 12.0.sp,
                            fontweight: FontWeight.bold,
                            firstgradientcolor: '#FF9900',
                            secondgradientcolor: '#FFF500');
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
