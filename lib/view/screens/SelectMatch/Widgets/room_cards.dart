// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:tambola_frontend/controller/local_db/match_handling.dart';
import 'package:tambola_frontend/models/match_data.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';
import 'package:tambola_frontend/view/screens/WaitingRoom/select_ticket_room.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class RoomCard extends StatefulWidget {
  final String? text;
  final int? activeuser;
  final double? roomtype;
  final int entryfee;
  final String matchID;
  final int gameType;

  RoomCard({
    this.gameType = 100,
    this.matchID = "",
    Key? key,
    this.text,
    this.activeuser,
    this.roomtype,
    required this.entryfee,
  }) : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  double tambolaPrize = 0;

  double otherPrize = 0;

  // double row2Prize = 0;

  // double row3Prize = 0;

  // double first5Prize = 0;

  double toPlayersPrize = 0;

  calculatePrize(int Type, int entryFee) {
    int totalPrize = entryFee * Type;
    switch (entryFee) {
      case 5:
        toPlayersPrize = (80 * totalPrize / 100);
        tambolaPrize = (40 * toPlayersPrize / 100);
        otherPrize = (10 * toPlayersPrize / 100);
        print(tambolaPrize);
        break;
      case 10:
        toPlayersPrize = (75 * totalPrize / 100);
        tambolaPrize = (37.5 * toPlayersPrize / 100);
        otherPrize = (9.3 * toPlayersPrize / 100);
        break;
      case 15:
        toPlayersPrize = (70 * totalPrize / 100);
        tambolaPrize = (35 * toPlayersPrize / 100);
        otherPrize = (8.7 * toPlayersPrize / 100);
        break;
      default:
        toPlayersPrize = (60 * totalPrize / 100);
        tambolaPrize = (30 * toPlayersPrize / 100);
        otherPrize = (7.5 * toPlayersPrize / 100);
    }

    // break;
  }

  @override
  Widget build(BuildContext context) {
    calculatePrize(widget.gameType, widget.entryfee);
    return ScreenUtilInit(
      builder: (context, child) => Container(
        margin: EdgeInsets.only(bottom: 8),
        width: 358.w,
        height: 167.h,
        decoration: BoxDecoration(
            gradient: metallicGradient,
            borderRadius: BorderRadius.circular(25.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 25.w, bottom: 10.h),
              child: Row(
                children: [
                  NewCoustomText(
                    text: "Active players:".tr,
                    fontsize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: [fromCssColor("#484848"), fromCssColor("#2C2C2C")],
                    shadowoffset: Offset(0.0, 5.0),
                    shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                    shawdowradius: 6.r,
                  ),
                  SizedBox(width: 20.w),
                  NewCoustomText(
                    text: "${widget.activeuser}/${widget.gameType}",
                    fontsize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: [fromCssColor("#006B8D"), fromCssColor("#00181E")],
                    shadowoffset: Offset(0.0, 5.0),
                    shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                    shawdowradius: 6.r,
                  ),
                  SizedBox(width: 40.w),
                  NewCoustomText(
                    text: "Entry Fees".tr,
                    fontsize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: [fromCssColor("#002D36"), fromCssColor("#002D36")],
                    shadowoffset: Offset(0.0, 5.0),
                    shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                    shawdowradius: 6.r,
                  ),
                  SizedBox(width: 5.w),
                  Image.asset("assets/images/coin.png",
                      width: 12.w, height: 14.h),
                  NewCoustomText(
                    text: widget.entryfee.toInt().toString(),
                    fontsize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: [fromCssColor("#FF9900"), fromCssColor("#FFF500")],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 235.w,
                  height: 84.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      children: [
                        Center(
                          child: NewCoustomText(
                            text: "WINNING PRIZE".tr,
                            fontsize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: [
                              fromCssColor("#006B8D"),
                              fromCssColor("#00181E")
                            ],
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            ReuseableRoomContainer(
                                containerText: "FIRST 5",
                                containerAmount: otherPrize.toInt().toString()),
                            SizedBox(width: 5.w),
                            ReuseableRoomContainer(
                                containerText: "ROW 1",
                                containerAmount: otherPrize.toInt().toString()),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            ReuseableRoomContainer(
                                containerText: "ROW 2",
                                containerAmount: otherPrize.toInt().toString()),
                            SizedBox(width: 5),
                            ReuseableRoomContainer(
                                containerText: "ROW 3",
                                containerAmount: otherPrize.toInt().toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w, top: 8.h),
                  child: Container(
                    width: 90.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: maroonGradient),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 4.h),
                          NewCoustomText(
                            text: "Tambola",
                            fontsize: 19.sp,
                            fontFamily: 'IrishGrover',
                            fontWeight: FontWeight.bold,
                            color: [
                              fromCssColor("#FF9900"),
                              fromCssColor("#FFF500")
                            ],
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/coin.png",
                                  width: 21.w, height: 24.h),
                              NewCoustomText(
                                text: tambolaPrize.toInt().toString(),
                                fontsize: 19.sp,
                                fontWeight: FontWeight.bold,
                                color: [
                                  fromCssColor("#FF9900"),
                                  fromCssColor("#FFF500")
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(width: 5.w),
                CustomButton2(
                    text: "Invite".tr,
                    fontsize: 15.sp,
                    fontWeight: FontWeight.bold,
                    width: 70.w,
                    width2: 50.w,
                    height: 38.h,
                    height2: 24.h,
                    gradient1: blueLiner2Gradient,
                    gradient2: metallicGradient,
                    color: [fromCssColor("#006B8D"), fromCssColor("#00181E")]),
                SizedBox(width: 5.w),
                Consumer<GameProvider>(builder: (context, gameState, _) {
                  return InkWell(
                    onTap: () async {
                      GlobalMatchData? gData = await HandleMatch().getLocal(
                          context,
                          widget.gameType.toString() +
                              widget.entryfee.toString());
                      if (gData != null) {
                        Provider.of<GameProvider>(context, listen: false)
                            .setGameState(matchID: gData.matchId);
                      }
                      if (gData == null) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        final userID = pref.getString("userID");
                        // if (gData.matchId == null) {
                        if (userID != null) {
                          await GameServices()
                              .createMatch(
                                  createdID: userID,
                                  gameType: widget.gameType.toString(),
                                  gameFee: widget.entryfee,
                                  context: context)
                              .then((value) async {
                            if (value == true) {
                              Provider.of<GameProvider>(context, listen: false)
                                  .setWinAmts(
                                      value: tambolaPrize.toInt(),
                                      otherVal: otherPrize.toInt());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectTicketScreen(
                                            gameType: widget.gameType,
                                            // matchID: matchID,
                                            isCreater: true,
                                          )));
                            } else {
                              showSnackBarText(
                                  context, "Something went wrong !!!");
                            }
                          });
                        }
                      } else {
                        print(
                            "ROOM CARD GAME JOINING )))))))))((((((((((()))))))))))((((((((((((())))))))))))(((((()");
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        final userID = pref.getString("userID");
                        await GameServices()
                            .joinMatch(
                                createdID: userID!,
                                gameType: widget.gameType.toString(),
                                gameFee: widget.entryfee,
                                matchID: gameState.matchId,
                                context: context)
                            .then((value) {
                          if (value == true) {
                            Provider.of<GameProvider>(context, listen: false)
                                .setWinAmts(
                                    value: tambolaPrize.toInt(),
                                    otherVal: otherPrize.toInt());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectTicketScreen(
                                          gameType: widget.gameType,
                                          // matchID: matchID,
                                          isCreater: false,
                                        )));
                          } else {
                            // showSnackBarText(
                            //     context, "Something went wrong !!!");
                          }
                        });
                      }
                    },
                    child: gameState.isLoading
                        ? SizedBox(
                            width: 105.w,
                            height: 43.h,
                            child: Center(
                                child: SizedBox(
                                    width: 23.h,
                                    height: 23.h,
                                    child: CircularProgressIndicator())),
                          )
                        : CustomButton2(
                            text: "Play".tr,
                            fontsize: 21.sp,
                            fontWeight: FontWeight.bold,
                            width: 105.w,
                            width2: 70.w,
                            height: 43.h,
                            height2: 29.h,
                            gradient1: blueLiner2Gradient,
                            gradient2: fireLinearGradient,
                            color: [
                                fromCssColor("#006B8D"),
                                fromCssColor("#00181E"),
                              ]),
                  );
                }),
                SizedBox(width: 5.w),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddMoneyScreen()));
                  },
                  child: CustomButton2(
                    text: "BUY TICKET".tr,
                    fontsize: 13.sp,
                    fontWeight: FontWeight.bold,
                    width: 130.w,
                    width2: 100.w,
                    height: 38.h,
                    height2: 24.h,
                    gradient1: blueLiner2Gradient,
                    gradient2: metallicGradient,
                    color: [fromCssColor("#006B8D"), fromCssColor("#00181E")],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableRoomContainer extends StatelessWidget {
  final String containerText;
  final String containerAmount;
  const ReuseableRoomContainer({
    Key? key,
    required this.containerText,
    required this.containerAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 103.w,
        height: 25.5.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r), gradient: maroonGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(width: 10.w),
            NewCoustomText(
              text: containerText,
              fontsize: 9.sp,
              fontWeight: FontWeight.bold,
              color: [fromCssColor("#FFFFFF"), fromCssColor("#FFFFFF")],
            ),
            SizedBox(width: 16.w),
            Image.asset("assets/images/coin.png", width: 16.w, height: 16.h),
            NewCoustomText(
              text: containerAmount,
              fontsize: 13.sp,
              fontWeight: FontWeight.bold,
              color: [fromCssColor("#FF9900"), fromCssColor("#FFF500")],
            ),
          ],
        ),
      ),
    );
  }
}
