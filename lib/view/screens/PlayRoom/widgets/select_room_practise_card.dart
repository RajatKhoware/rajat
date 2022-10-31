// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/controller/providers/game_provider.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../AddMoney/add_money_page.dart';
import '../../SelectMatch/select_room.dart';

class PractiseRoomCard extends StatefulWidget {
  const PractiseRoomCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PractiseRoomCard> createState() => _PractiseRoomCardState();
}

class _PractiseRoomCardState extends State<PractiseRoomCard> {
  TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    //SocketMethods socketMethods = SocketMethods();

    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 175.h,
        width: 364.12.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kBlackLinear1, kBlackLinear2],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 4), blurRadius: 4.0.r)
            ],
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 5.0.h,
          ),
          Center(
            child: FittedBox(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'open only Weekends'.tr,
                  style: TextStyle(
                      color: kCardGradient1,
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500),
                ),
              ])),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 58.h),
            child: SizedBox(
              width: 253.w,
              height: 23.h,
              child: RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Image(
                  height: 30.h,
                  width: 30.w,
                  image: AssetImage('assets/images/coin-small.png'),
                )),
                WidgetSpan(
                    child: PlayRoomGradientText(
                  text: "0.02   -   ",
                  fontsize: 25.sp,
                  fontWeight: FontWeight.w500,
                )),
                WidgetSpan(
                    child: Image(
                  height: 30.h,
                  width: 30.w,
                  image: AssetImage('assets/images/coin-small.png'),
                )),
                WidgetSpan(
                  child: PlayRoomGradientText(
                      text: "1 ", fontsize: 25.sp, fontWeight: FontWeight.w500),
                )
              ])),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
            child: SizedBox(
              width: 332.w,
              height: 35.h,
              child: Center(
                child: PlayRoomGradientText(
                    text: "Pracise & Play with friends".tr,
                    fontsize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 332.w,
              height: 52.h,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/PlayroomVector.png'),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () async {
                      String text = "Welcome to Tambola";
                      tts.speak(text);
                         Provider.of<GameProvider>(context, listen: false)
                        .setGameStateBegin();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 2,
                                  )));
                    },
                    child: PlayRoomCustomButton(
                        width: 200.w,
                        width2: 170.w,
                        height: 52.h,
                        height2: 42.h),
                  ),
                  SizedBox(width: 10.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/PlayroomVector.png'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class PlayRoomGradientText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;

  const PlayRoomGradientText({
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
        fromCssColor('#FFFFFF'),
        fromCssColor('#E7E7E7'),
        fromCssColor('#CACACA'),
        fromCssColor('#C0C0C0'),
      ],
    );
  }
}

class PlayRoomCustomButton extends StatelessWidget {
  final double width;
  final double width2;
  final double height;
  final double height2;
  const PlayRoomCustomButton({
    Key? key,
    required this.width,
    required this.width2,
    required this.height,
    required this.height2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Stack(children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: metallicGradient,
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
                child: PlayRoomGradientText(
                    text: "Play Now".tr,
                    fontsize: 23.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
