// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/export.dart';

import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/view/screens/WaitingRoom/waiting_room_screen.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';

import '../../components/header.dart';

class SelectTicketScreen extends StatelessWidget with BaseClass {
  final bool isCreater;
  final int gameType;
  const SelectTicketScreen(
      {Key? key, required this.isCreater, required this.gameType})
      : super(key: key);

  ticketOnTap(BuildContext context, String matchID, String ticketCount) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userID = pref.getString("userID");
    if (userID != null) {
      showLoader(context);
      await GameServices()
          .getTicket(userID: userID, matchID: matchID, context: context)
          .then((value) {
        if (value == true) {
          popToPreviousScreen(context: context);
          pushToNextScreenWithAnimation(
              context: context,
              destination: WaitingRoomScreen(
                gameType: gameType,
                matchID: matchID,
                isCreater: isCreater,
              ));
        } else {
          GameServices().leaveGame(matchId: matchID);
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(gradient: newgreycarddarkliner),
            child: Consumer<GameProvider>(builder: (context, gameState, _) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderWidget(
                      gradient1: whitegradient,
                      gradient2: whitegradient,
                      gradient3: whitegradient,
                      gradient4: greenLinear,
                      gradient5: whitegradient,
                    ),
                    // SizedBox(height: 15.h),
                    NewCoustomText2(
                      text: "Selet one Ticket".tr,
                      fontsize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: newgreytextgradient.colors,
                    ),
                    // SizedBox(height: 15.h),
                    Row(
                      children: [
                        SizedBox(width: 85.w),
                        Tickets(
                            text: "1",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '1')),
                        SizedBox(width: 40.w),
                        Tickets(
                            text: "2",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '2'))
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 85.w),
                        Tickets(
                            text: "3",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '3')),
                        SizedBox(width: 40.w),
                        Tickets(
                            text: "4",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '4'))
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 85.w),
                        Tickets(
                            text: "5",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '5')),
                        SizedBox(width: 40.w),
                        Tickets(
                            text: "6",
                            onTap: () async =>
                                ticketOnTap(context, gameState.matchId, '6')),
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    CustomButton2(
                        text: "Select Random".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 289.w,
                        width2: 269.w,
                        height: 50.h,
                        height2: 35.h,
                        gradient1: newblue2liner,
                        gradient2: newRadial_r_1_5,
                        color: newgreygradient.colors)
                  ]);
            }),
          );
        }),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class Tickets extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const Tickets({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => CustomPaint(
        painter: BoxShadowPainter(),
        child: ClipPath(
          clipper: Clip1Clipper(),
          child: InkWell(
            onTap: onTap,
            child: Container(
                height: 185.h,
                width: 107.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                  gradient: newRadial_r_0_7,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 30.h, left: 30.w, right: 30.w, bottom: 50.h),
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: fromCssColor("#F5FAFF")),
                    child: Center(
                        child: NewCoustomText(
                            text: text,
                            fontsize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: newblueliner.colors)),
                  ),
                )),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width / 3.05, size.height / 1.25);
    path.lineTo(size.width / 1.60, size.height / 1.25);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes

    path.lineTo(0, size.height);
    path.lineTo(size.width / 3.00, size.height / 1.25);
    path.lineTo(size.width / 1.60, size.height / 1.25);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.close();

    canvas.drawShadow(path, Colors.black, 4.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
