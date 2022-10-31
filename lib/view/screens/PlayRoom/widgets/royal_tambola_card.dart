import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import '../../SelectRoom/select_room.dart';

class RoyalTambolaCard extends StatelessWidget {
  const RoyalTambolaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        // height: 261.h,
        width: 368.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        decoration: BoxDecoration(
            gradient: blackLinear,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 4), blurRadius: 4.0.r)
            ],
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(children: [
          SizedBox(
            height: 5.0.h,
          ),
          Consumer<GameProvider>(builder: (context, gameState, _) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Total Active players     '.tr,
                    style: TextStyle(
                        color: activeButtonColor2,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: '${gameState.activeUsers.length}',
                      style:
                          TextStyle(fontSize: 11.sp, color: activeButtonColor2))
                ],
              ),
            );
          }),
          SizedBox(
            height: 24.h,
          ),
          PlayRoomGradientText2(
              text: "ROYAL TAMBOLA".tr,
              fontsize: 23.sp,
              fontWeight: FontWeight.bold),
          PlayRoomGradientText2(
              text: "WINNING PRIZE".tr,
              fontsize: 24.sp,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 24.h,
          ),
          RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Image(
              height: 30.h,
              width: 30.w,
              image: AssetImage('assets/images/coin-small.png'),
            )),
            WidgetSpan(
                child: PlayRoomGradientText2(
                    text: "4 - ",
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold)),
            WidgetSpan(
                child: Image(
              height: 30.h,
              width: 30.w,
              image: AssetImage('assets/images/coin-small.png'),
            )),
            WidgetSpan(
                child: PlayRoomGradientText2(
                    text: "3,00,000",
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold))
          ])),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 332.w,
            height: 52.h,
            child: Row(
              children: [
                SizedBox(width: 15.w),
                Image(
                  height: 40.h,
                  width: 25.w,
                  image: AssetImage('assets/images/PlayroomVector2.png'),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    Provider.of<GameProvider>(context, listen: false)
                        .setGameStateBegin();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectRoom()));
                  },
                  child: PlayRoomCustomButton2(
                      label: "Play Now".tr,
                      width: 200.w,
                      width2: 170.w,
                      height: 52.h,
                      height2: 42.h),
                ),
                SizedBox(width: 10.w),
                Image(
                  height: 40.h,
                  width: 25.w,
                  image: AssetImage('assets/images/PlayroomVector2.png'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class PlayRoomGradientText2 extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;

  const PlayRoomGradientText2({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: .5,
      colors: [
        fromCssColor('#FF9900'),
        fromCssColor('#FFF500'),
      ],
    );
  }
}

class PlayRoomCustomButton2 extends StatelessWidget {
  final double width;
  final double width2;
  final double height;
  final double height2;
  final String label;
  const PlayRoomCustomButton2(
      {Key? key,
      required this.width,
      required this.width2,
      required this.height,
      required this.height2,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Stack(children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: fireLinearGradient,
              borderRadius: BorderRadius.circular(40.r)),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(top: 5.h, left: 15.w),
            child: Container(
              width: width2,
              height: height2,
              decoration: BoxDecoration(
                  gradient: blackLinear,
                  borderRadius: BorderRadius.circular(40.r)),
              child: Center(
                child: PlayRoomGradientText2(
                    text: label, fontsize: 23.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
