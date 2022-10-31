import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectMatch/select_room.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';

class SelectRoomCard1 extends StatelessWidget {
  final Function()? onTap;
  const SelectRoomCard1({
    this.onTap,
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
            gradient: newmetallicGradient2,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 66, 66, 66),
                  offset: Offset(0, 6),
                  blurRadius: 4.0.r)
            ],
            border: Border.all(width: 2.w, color: Colors.blue),
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(children: [
          SizedBox(
            height: 7.0.h,
          ),
          Consumer<GameProvider>(builder: (context, gameState, _) {
            return NewCoustomText(
              text: "Active players: ${gameState.activeUsers.length}".tr,
              // "Active players:    ${gameState.activeUsers.length}",
              fontsize: 11.sp,
              fontWeight: FontWeight.bold,
              color: newblueliner.colors,
              shadowoffset: Offset(0.0, 4.0),
              shawdowcolor: Color.fromARGB(64, 0, 0, 0),
              shawdowradius: 6.r,
            );
          }),
          SizedBox(
            height: 20.h,
          ),
          NewCoustomText(
            text: "Room of 5".tr,
            fontsize: 22.sp,
            fontWeight: FontWeight.bold,
            color: newblueliner.colors,
            shadowoffset: Offset(0.0, 4.0),
            shawdowcolor: Color.fromARGB(64, 0, 0, 0),
            shawdowradius: 6.r,
          ),
          NewCoustomText(
            text: "WINNING PRIZE".tr,
            fontsize: 25.sp,
            fontWeight: FontWeight.bold,
            color: newblueliner.colors,
            shadowoffset: Offset(0.0, 4.0),
            shawdowcolor: Color.fromARGB(64, 0, 0, 0),
            shawdowradius: 6.r,
          ),
          SizedBox(
            height: 26.h,
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
                child: NewCoustomText(
              text: "15 - ",
              fontsize: 25.sp,
              fontWeight: FontWeight.bold,
              color: newblueliner.colors,
            )),
            WidgetSpan(
                child: Image(
              height: 30.h,
              width: 30.w,
              image: AssetImage('assets/images/coin-small.png'),
            )),
            WidgetSpan(
                child: NewCoustomText(
              text: "3000",
              fontsize: 25.sp,
              fontWeight: FontWeight.bold,
              color: newblueliner.colors,
            ))
          ])),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 311.w,
            height: 52.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  height: 41.h,
                  width: 40.w,
                  image: AssetImage('assets/images/Vector3.png'),
                ),
                InkWell(
                  onTap: onTap,
                  // SharedPreferences pref =
                  //     await SharedPreferences.getInstance();
                  // final userID = pref.getString("userID");
                  // if (userID != null) {
                  //   GameServices()
                  //       .createMatch(createdID: userID, context: context);
                  // }
                  // },
                  child: CustomButton2(
                    width: 211.w,
                    width2: 180.w,
                    height: 52.h,
                    height2: 40.h,
                    text: "Play Now".tr,
                    color: newblueliner.colors,
                    fontsize: 23.sp,
                    fontWeight: FontWeight.bold,
                    gradient1: newblueliner,
                    gradient2: newmetallicGradient,
                    shadowoffset: Offset(0.0, 4.0),
                    shawdowcolor: Color.fromARGB(64, 0, 0, 0),
                    shawdowradius: 6.r,
                  ),
                ),
                Image(
                  height: 41.h,
                  width: 40.w,
                  image: AssetImage('assets/images/Vector3.png'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
