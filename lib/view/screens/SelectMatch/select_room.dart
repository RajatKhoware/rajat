import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/view/screens/SelectMatch/Widgets/room_cards.dart';

import '../../constants/gradients.dart';
import '../../components/header.dart';

class SelectMatchRoom extends StatelessWidget {
  final int gameType;
  const SelectMatchRoom({Key? key, required this.gameType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: metallicGradient),
          child: Column(
            children: [
              HeaderWidget(
                gradient1: whitegradient,
                gradient2: greenLinear,
                gradient3: whitegradient,
                gradient4: whitegradient,
                gradient5: whitegradient,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                // alignment: Alignment.center,
                // width: 218.15.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: blueLiner2Gradient),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 15.w),
                    GradientText(
                      "ROOM OF  $gameType".tr,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize!,
                        fontWeight: FontWeight.w600,
                      ),
                      gradientType: GradientType.linear,
                      gradientDirection: GradientDirection.ttb,
                      radius: .5.r,
                      colors: [
                        fromCssColor('#FFFFFF'),
                        fromCssColor('#CACACA'),
                      ],
                    ),
                    // SizedBox(width: 2.w),
                    IconButton(
                      tooltip: "Select a game * number of members",
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          size: 25.sp,
                          color: Color.fromARGB(255, 252, 165, 67),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  children: [
                    RoomCard(
                      
                      activeuser: 2,
                      entryfee: 5,
                      gameType: gameType,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 10,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 15,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 20,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 30,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 50,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 100,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 500,
                    ),
                    SizedBox(height: 10),
                    RoomCard(
                      gameType: gameType,
                      activeuser: 2,
                      entryfee: 1000,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(428, 915),
    );
  }
}
