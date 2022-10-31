import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/view/screens/WaitingRoom/waiting_room_screen.dart';
import 'package:tambola_frontend/view/screens/WalletCard/wallet_card.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';
import 'package:tambola_frontend/view/components/custom_text.dart';
import 'package:tambola_frontend/view/components/customized_button.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';
import 'package:tambola_frontend/view/components/header.dart';
import 'package:tambola_frontend/view/components/navbar/navbar_widget.dart';

class AddMoneyScreen extends StatefulWidget {
  final String matchID;
  final bool isCreater;
  const AddMoneyScreen(
      {Key? key, required this.matchID, required this.isCreater})
      : super(key: key);

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  String name = "";
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        // name = context.read<UserProvider>().user.name!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            HeaderWidget(
              gradient1: whitegradient,
              gradient2: whitegradient,
              gradient3: greenLinear,
              gradient4: whitegradient,
              gradient5: whitegradient,
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                height: 627.h,
                width: 359.w,
                decoration: BoxDecoration(
                    gradient: newblue2liner,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 191, 191, 191),
                          offset: Offset(8, 8),
                          spreadRadius: 8,
                          blurRadius: 8)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/avg.png'),
                      radius: 50.r,
                    ),
                    SizedBox(height: 9.h),
                    NewCoustomText(
                      text: "User Name",
                      fontsize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                      shadowoffset: Offset(0.0, 5.0),
                      shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                      shawdowradius: 6.r,
                    ),
                    NewCoustomText(
                      text: "User ID",
                      fontsize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: newredliner.colors,
                      shadowoffset: Offset(0.0, 5.0),
                      shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                      shawdowradius: 6.r,
                    ),
                    SizedBox(height: 9.h),
                    NewCoustomText(
                      text: "BUY TICKET",
                      fontsize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                      shadowoffset: Offset(0.0, 5.0),
                      shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                      shawdowradius: 6.r,
                    ),
                    SizedBox(height: 10.h),
                    NewCoustomText(
                      text: "Entry Fees",
                      fontsize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                      shadowoffset: Offset(0.0, 5.0),
                      shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                      shawdowradius: 6.r,
                    ),
                    SizedBox(height: 10.h),
                    NewCoustomText(
                      text: "₹ 50",
                      fontsize: 70.sp,
                      fontWeight: FontWeight.bold,
                      color: newfireliner.colors,
                      shadowoffset: Offset(0.0, 5.0),
                      shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                      shawdowradius: 6.r,
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (context) => NewWallet());
                      },
                      child: CustomButton2(
                          onTap: () async {
                            if (!widget.isCreater) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaitingRoomScreen(
                                        gameType: 0,
                                            matchID: widget.matchID,
                                            isCreater: false,
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaitingRoomScreen(
                                        gameType: 0,
                                            matchID: widget.matchID,
                                            isCreater: true,
                                          )));
                            }
                          },
                          text: "Add Money",
                          fontsize: 23.sp,
                          fontWeight: FontWeight.bold,
                          width: 300.w,
                          width2: 269.w,
                          height: 50.h,
                          height2: 35.h,
                          gradient1: newdarkgreenliner,
                          gradient2: newgreenliner,
                          color: newgreygradient.colors),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
