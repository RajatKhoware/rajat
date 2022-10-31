import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/view/screens/Game/tambola_board.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';
import 'package:tambola_frontend/view/components/header.dart';

class WaitingRoomScreen extends StatefulWidget {
  final int activeCount;
  final String matchID;
  final bool isCreater;
  final int gameType;

  const WaitingRoomScreen(
      {Key? key,
      this.activeCount = 2,
      required this.gameType,
      required this.matchID,
      required this.isCreater})
      : super(key: key);

  @override
  State<WaitingRoomScreen> createState() => _WaitingRoomScreenState();
}

Timer? _timer;

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  //  ComputeImpl compute = compute;
  int currentMembers = 0;
  bool isCounted = false;
  int _start = 10;
  int _secondStart = 60;
  bool isState = false;
  @override
  void initState() {
    List<dynamic> draw = context.read<GameProvider>().draw;
    super.initState();
  }

  void checkActiveCount() {
    // Provider.of<GameProvider>(context, listen: false).changeStart();

    startTimer();
    log('^^^^^      START TIMER METHOD CALL       ^^^^^^');
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          // setState(() {
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TambolaBoard(
                        isCreater: widget.isCreater,
                        matchID: widget.matchID,
                      )));
          // });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  secondaryTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondStart == 0) {
          // setState(() {
          timer.cancel();

          // });

        } else {
          setState(() {
            _secondStart--;
          });
        }
      },
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );

    return exitResult ?? false;
  }

  // Future<bool?> _showExitDialog(BuildContext context) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (context) => _buildExitDialog(context),
  //   );
  // }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 4.0),
      title: const Text('Please confirm'),
      content: Wrap(
        children: [
          const Text('Do you want to end the game?'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Text(
              'All game data will be cleared !',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () async {
            // isStarted = false;
            Provider.of<GameProvider>(context, listen: false)
                .setGameState(matchID: "");
            Provider.of<GameProvider>(context, listen: false)
                .setGameStateBegin();

            Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("BUILDER REPEATLY CALLING");
      // secondaryTimer();

      bool isStart = Provider.of<GameProvider>(context, listen: false).isStart;
      print({widget.isCreater, isCounted, isStart});
      if (!widget.isCreater && !isCounted && isStart) {
        log("CONDITIONS TRUE");
        isCounted = true;
        await GameServices()
            .startMatch(matchID: widget.matchID, context: context)
            .then((value) async {
          print(
              "REST : START MATCH THEN VALUE IS >>>>>>>>>>>$value<<<<<<<<<<<");
          if (value == true) {
            log("ASSCCSCS TRUE");
            List<dynamic> draw =
                Provider.of<GameProvider>(context, listen: false).draw;
            List<int> newDraw = List<int>.from(draw);
            List<String> users =
                Provider.of<GameProvider>(context, listen: false).gameActive;
            print({widget.matchID, newDraw, users});
            int matchType =
                Provider.of<GameProvider>(context, listen: false).matchType;

            SocketMethods().socketStart(
                roomID: widget.matchID,
                draw: newDraw,
                users: users,
                matchType: matchType);
            checkActiveCount();
          } else {
            showSnackBarText(context, "Waiting for opponents !!!");
            Provider.of<GameProvider>(context, listen: false)
                .changeStart(state: true);
            Provider.of<GameProvider>(context, listen: false)
                .setMemberStatus(state: true);
          }
        });
      }
    });

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Column(
          children: [
            HeaderWidget(
              gradient1: whitegradient,
              gradient2: whitegradient,
              gradient3: whitegradient,
              gradient4: whitegradient,
              gradient5: greenLinear,
            ),
            const SizedBox(
                // height: 20,
                ),
            SingleChildScrollView(
              child: Consumer<UserProvider>(builder: (context, userState, _) {
                return Container(
                  margin: EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  // height: size.height * 0.65,
                  width: 359,
                  decoration: BoxDecoration(
                    gradient: newblue2liner,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 191, 191, 191),
                          offset: Offset(8, 8),
                          spreadRadius: 8,
                          blurRadius: 8)
                    ],
                  ),
                  child: Column(children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/avg.png'),
                      radius: 50,
                    ),
                    // SizedBox(height: 30),
                    NewCoustomText(
                        text: userState.user.user.username ?? "User Name",
                        fontsize: 28,
                        fontWeight: FontWeight.bold,
                        color: metallicGradient.colors),
                    SizedBox(height: 5),
                    NewCoustomText(
                        text: userState.user.user.id ?? "UserID",
                        fontsize:
                            Theme.of(context).textTheme.bodySmall!.fontSize!,
                        fontWeight: FontWeight.bold,
                        color: newredliner.colors),
                    SizedBox(height: size.width / 11),
                    NewCoustomText(
                        text: "waiting for members to join".tr,
                        fontsize:
                            Theme.of(context).textTheme.bodySmall!.fontSize!,
                        fontWeight: FontWeight.bold,
                        color: metallicGradient.colors),
                    SizedBox(height: 15),
                    // StreamBuilder<int>(
                    //     stream: GameServices().getMemberCount(
                    //         context: context, matchId: widget.matchID),
                    //     builder: (context, AsyncSnapshot snapshot) {
                    //       StreamSubscription sub ;
                    //       int val = 0;
                    //       if (snapshot.hasData) {
                    //         val = (widget.gameType - snapshot.data) as int;
                    //         currentMembers = val;
                    //         print(val);
                    //         if(widget.gameType == currentMembers){
                    //           // sub.cancel();
                    //         }
                    //       } else {
                    //         // secondaryTimer();
                    //       }
                    //       return snapshot.hasData
                    //           ? NewCoustomText(
                    //               text: val.toString(),
                    //               fontsize: Theme.of(context)
                    //                   .textTheme
                    //                   .titleLarge!
                    //                   .fontSize!,
                    //               fontWeight: FontWeight.bold,
                    //               color: newfireliner.colors)
                    // :
                    NewCoustomText(
                        text: "Fetching failed".tr,
                        fontsize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize!,
                        fontWeight: FontWeight.bold,
                        color: metallicGradient.colors),
                    // ;
                    // }
                    // ),
                    SizedBox(height: 11),

                    NewCoustomText(
                        text: "Wating Time".tr,
                        fontsize:
                            Theme.of(context).textTheme.titleLarge!.fontSize!,
                        fontWeight: FontWeight.bold,
                        color: metallicGradient.colors),
                    // SizedBox(height: 35),
                    Consumer<GameProvider>(builder: (context, gameState, _) {
                      if (gameState.draw.isNotEmpty && !isCounted && !isState) {
                        isState = true;
                        print("CONSUMER BUILDER CALLING ALL THE TIME");
                        checkActiveCount();
                      }
                      if (gameState.draw.isNotEmpty &&
                          gameState.isMember &&
                          !isState) {
                        print("CONSUMER BUILDER FOR MIDDLE MEMBERS");
                        isState = true;
                        checkActiveCount();
                      }

                      return RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: NewCoustomText(
                                text:
                                    //  (widget.gameType == currentMembers)
                                    // ?
                                    _start.toString()
                                // : _secondStart.toString()
                                ,
                                fontsize: 40,
                                fontWeight: FontWeight.bold,
                                color: newfireliner.colors),
                          ),
                          WidgetSpan(
                            child: NewCoustomText(
                                text: "Seconds".tr,
                                fontsize: 40,
                                fontWeight: FontWeight.w700,
                                color: metallicGradient.colors),
                          ),
                        ]),
                      );
                    }),
                    SizedBox(
                      height: size.height % 3,
                    ),
                    NewCoustomText(
                        text: "Get Ready".tr,
                        fontsize: 28,
                        fontWeight: FontWeight.bold,
                        color: metallicGradient.colors),
                  ]),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
