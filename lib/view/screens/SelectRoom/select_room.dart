import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectMatch/select_room.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/card_1.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/reuseable_card_select_room.dart';
// import 'package:tambola_frontend/widgets/navbar/new_nav_bar.dart';

import '../../constants/gradients.dart';
import '../../components/header.dart';

class SelectRoom extends StatelessWidget {
  const SelectRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 197, 197, 197)),
          child: Column(children: [
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
            InkWell(
              onTap: () {},
              child: Container(
                width: 218.15.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: blueLiner2Gradient),
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    GradientText(
                      "Select Game".tr,
                      style: TextStyle(
                        fontSize: 25.0.sp,
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
                    SizedBox(width: 2.w),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            size: 25.sp,
                            color: Color.fromARGB(255, 252, 165, 67),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                children: [
                  SelectRoomCard1(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 5,
                                  )));
                    },
                  ),
                  //   SelectRoomReuseableCard(
                  //   colors: newbrownliner.colors,
                  //   Roomof: '10',
                  //   gradient1: newmetallicGradient2,
                  //   amount1: "15",
                  //   amount2: "3000",
                  // ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 10,
                                  )));
                    },
                    colors: newbrownliner.colors,
                    Roomof: '10',
                    gradient1: newbrownliner,
                    amount1: "35",
                    amount2: "7000",
                  ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 15,
                                  )));
                    },
                    colors: newdarkpurplepastelliner.colors,
                    Roomof: '15',
                    gradient1: newdarkpurplepastelliner,
                    amount1: "65",
                    amount2: "1500",
                  ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 20,
                                  )));
                    },
                    colors: newblacklinergradient.colors,
                    Roomof: '20',
                    gradient1: newblacklinergradient,
                    amount1: "150",
                    amount2: "30000",
                  ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 50,
                                  )));
                    },
                    colors: newpurpleredliner.colors,
                    Roomof: '50',
                    gradient1: newpurpleredliner,
                    amount1: "7500",
                    amount2: "15000",
                  ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 100,
                                  )));
                    },
                    colors: newbluepurpleliner.colors,
                    Roomof: '100',
                    gradient1: newbluepurpleliner,
                    amount1: "15000",
                    amount2: "300000",
                  ),
                  SizedBox(height: 20.h),
                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 500,
                                  )));
                    },
                    colors: newbluepurpleliner.colors,
                    Roomof: '500',
                    gradient1: newbluepurpleliner,
                    amount1: "15000",
                    amount2: "300000",
                  ),
                  SizedBox(height: 20.h),

                  SelectRoomReuseableCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectMatchRoom(
                                    gameType: 1000,
                                  )));
                    },
                    colors: newbluepurpleliner.colors,
                    Roomof: '1000',
                    gradient1: newbluepurpleliner,
                    amount1: "15000",
                    amount2: "300000",
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ]),
        ),
        // bottomNavigationBar: NewNavBar(),
      ),
      designSize: const Size(428, 915),
    );
  }
}
