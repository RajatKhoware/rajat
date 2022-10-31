// ignore_for_file:  use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/controller/audio/audio.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/strings.dart';
import 'package:tambola_frontend/controller/providers/game_provider.dart';
import 'package:tambola_frontend/controller/resources/socket_methods.dart';
import 'package:tambola_frontend/view/screens/Game/tambola_ticket.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';
import 'package:tambola_frontend/view/components/countdown.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../../controller/utils/showSnackBar.dart';

class TambolaBoard extends StatefulWidget {
  final String matchID;
  final bool isCreater;
  const TambolaBoard({Key? key, required this.matchID, required this.isCreater})
      : super(key: key);

  @override
  State<TambolaBoard> createState() => _TambolaBoardState();
}

//all the claims
enum ClaimType { firstFive, topRow, middleRow, bottomRow, tambola }

//list of all the numbers on the board
List<dynamic> allNumbers = [];
//initializing a list of numbers which are called from the backend
List<int> calledNumbers = [];
//list of numbers the user has striked from their ticket
List<int> crossedNumbers = [];
int currentNumber = 0;
//numbers striked in the rows
List<int> row1 = [];
List<int> row2 = [];
List<int> row3 = [];
bool showTable = true;

class _TambolaBoardState extends State<TambolaBoard> with BaseClass {
  TextToSpeech tts = TextToSpeech();
  late Timer timer;
  // Audioma
  bool isStarted = false;
  @override
  void initState() {
    // AudioManager().pause();
    log("TAMBOLA BOARD INIT STATE");
    super.initState();
    //  isStarted = false;
    allNumbers.clear();
    calledNumbers.clear();
    crossedNumbers.clear();
    row1.clear();
    row2.clear();
    row3.clear();

    allNumbers = Provider.of<GameProvider>(context, listen: false).draw;
    //! Provider.of<GameProvider>(context).gameTicket = randomTicket;
    // Provider.of<GameProvider>(context, listen: false)
    //     .setGameState(matchID: widget.matchID);
    int counter = 0;
    if (!isStarted) {
      // SocketMethods().finishGame(roomID: widget.matchID);

      timer = Timer.periodic(drawLatency, (timer) async {
        Provider.of<GameProvider>(context, listen: false)
            .updateCurrentValue(value: allNumbers[counter]);
        //! Provider.of<GameProvider>(context, listen: false)
        //     .gameCalledNumbers
        //     .add(allNumbers[counter]);
        isStarted = true;
        // log("updating current value state ${allNumbers[counter].toString()}");
        currentNumber =
            Provider.of<GameProvider>(context, listen: false).currentValue;
        getNextNumber();
        tts.speak(currentNumber.toString());
        counter++;
        if (counter == 90 ||
            Provider.of<GameProvider>(context, listen: false)
                .isClaimedTambola) {
          timer.cancel();
          isStarted = false;
        }
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );

    return exitResult ?? false;
  }
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
            isStarted = false;
            dispose();
            timer.cancel();
            // !  REMEMBER THIS COMMENT FOR GAME MATCH ID REMOVING //
            // Provider.of<GameProvider>(context, listen: false)
            //     .setGameState(matchID: "");
            Provider.of<GameProvider>(context, listen: false)
                .setGameStateBegin();
            Navigator.of(context).pushReplacementNamed("/bottom-bar");
            // pushNamedAndRemoveUntil(
            //     context: context, destination: "/bottom-bar");
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: builder), (route) => false)

            // Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (timer.isActive) timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AudioManager.pause();
    });
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: ScreenUtilInit(
        builder: (context, child) => Scaffold(
          body: Consumer<GameProvider>(
              builder: (context, gameState, _) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: greyLinerGradient),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //to show/hide the expanded ticket widget
                          // IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       showTable = !showTable;
                          //     });
                          //   },
                          //   icon: Icon(
                          //     showTable
                          //         ? Icons.keyboard_arrow_up
                          //         : Icons.keyboard_arrow_down,
                          //     color: Colors.amber,
                          //     size: 60,
                          //   ),
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Visibility(
                            visible: showTable,
                            child: Container(
                              height: 323.h,
                              width: 363.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: kWalletCardGradient2, width: 5),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 4,
                                        color: Color.fromARGB(141, 1, 20, 31))
                                  ]),
                              //   padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                              //creating a table of list<row> with each individual circular chip
                              child: SizedBox(
                                height: 303.h,
                                width: 337.w,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10.h,
                                        top: 2.h,
                                        right: 13.w,
                                        left: 13.w),
                                    child: Table(
                                      children: createChips(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Center(
                            child: GestureDetector(
                              // onTap: getNextNumber,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Container(
                                  width: 339.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                      gradient: blueLiner2Gradient,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.w, right: 21.w),
                                        child: GradientText(
                                          "Number",
                                          style: const TextStyle(
                                            // fontSize: 25.0,
                                            fontWeight: FontWeight.w500,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(4.0, 4.0),
                                                blurRadius: 10.0,
                                                color: Color.fromARGB(
                                                    123, 51, 51, 51),
                                              ),
                                            ],
                                          ),
                                          gradientType: GradientType.linear,
                                          gradientDirection:
                                              GradientDirection.ttb,
                                          radius: .5,
                                          colors: [
                                            fromCssColor('#FFFFFF'),
                                            fromCssColor('#C0C0C0'),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.w, horizontal: 3.h),
                                          child: CountDownPage(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 12.w),
                                        child: Icon(
                                          Icons.volume_up,
                                          color:
                                              Color.fromARGB(255, 255, 187, 0),
                                        ),
                                      ),
                                      Icon(
                                        Icons.volume_off,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 38.h,
                          // ),
                          SizedBox(
                            height: 64.83.h,
                            width: 272.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 64.h,
                                  width: 68.w,
                                  decoration: BoxDecoration(
                                      gradient: fireLinearGradient,
                                      shape: BoxShape.circle,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 6,
                                            color:
                                                Color.fromARGB(141, 1, 20, 31))
                                      ]),
                                  //displaying the current number
                                  child: Center(
                                    child: Text(
                                      currentNumber.toString(),
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          color:
                                              Color.fromARGB(220, 31, 31, 31),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),

                                //displaying the last 4 numbers from the called numbers
                                for (var i = calledNumbers.length - 2;
                                    i >= 0 && i > calledNumbers.length - 6;
                                    i--)
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Container(
                                      height: 43.83.h,
                                      width: 46.w,
                                      decoration: BoxDecoration(
                                          gradient: redLinear,
                                          shape: BoxShape.circle,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 3),
                                                blurRadius: 4,
                                                color: Color.fromARGB(
                                                    143, 1, 20, 31))
                                          ]),
                                      child: Center(
                                        child: Text(calledNumbers[i].toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 30.h,
                          // ),
                          Expanded(
                              flex: 8,
                              child: TambolaTicket(
                                checkWin: checkClaim,
                              )),
                          size.height > 700
                              ? Expanded(flex: 2, child: Container())
                              : Container(),
                        ]),
                  )),
        ),
        designSize: Size(436, 926),
      ),
    );
  }

  navigateToWinnersList(BuildContext context) async {
    print(widget.matchID);
    bool isTambola =
        Provider.of<GameProvider>(context, listen: false).isClaimedTambola;
    bool isFirstFive =
        Provider.of<GameProvider>(context, listen: false).isClaimedFirstFive;
    bool isTop = Provider.of<GameProvider>(context, listen: false).isClaimedTop;
    bool isMiddle =
        Provider.of<GameProvider>(context, listen: false).isClaimedMiddle;
    bool isBottom =
        Provider.of<GameProvider>(context, listen: false).isClaimedBottom;
    int timerr = 0;
    await Timer.periodic(const Duration(seconds: 1), (time) async {
      timerr++;
      if (isTambola && isFirstFive && isTop && isMiddle && isBottom) {
        print("isvaeeee");
        time.cancel();
        if (widget.isCreater) {
          SocketMethods().finishGame(roomID: widget.matchID);
        }
      } else {}
    });
  }

  //creating a matrix of circular chips(board items)
  List<TableRow> createChips() {
    List<TableRow> gameBoard = [];
    int id = 1;
    for (var i = 1; i < 10; i++) {
      List<Widget> currentRow = [];
      for (var j = 1; j < 11; j++, id++) {
        currentRow.add(TambolaChip(id: id));
      }
      gameBoard.add(TableRow(children: currentRow));
    }
    return gameBoard;
  }

  getNextNumber() {
    //generate a random number
    if (allNumbers.isNotEmpty) {
      // int randomNumber = allNumbers[Random.
      // secure().nextInt(allNumbers.length)];
      calledNumbers.add(currentNumber);
    } else {
      showSnackBarText(context, "GAME OVER!");
    }
  }

  //check if claim is valid
  checkClaim(ClaimType type) async {
    String matchId = Provider.of<GameProvider>(context, listen: false).matchId;
    GameServices gameService = GameServices();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    print({
      row1.length.toString(),
      row2.length.toString(),
      row3.length.toString()
    });
    switch (type) {
      case ClaimType.firstFive:
        if (row1.length + row2.length + row3.length >= 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "corner",
              context: context);
        } else {
          // showSnackBarText(context, "You haven't striked 5 numbers yet :(");
        }
        break;
      case ClaimType.topRow:
        if (row1.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "firstRow",
              context: context);
        } else {
          // showSnackBarText(
          //     context, "You haven't striked 5 numbers in the top row yet :(");
        }
        break;
      case ClaimType.middleRow:
        if (row2.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "secondRow",
              context: context);
        } else {
          // showSnackBarText(context,
          //     "You haven't striked 5 numbers in the middle row yet :(");
        }
        break;
      case ClaimType.bottomRow:
        if (row3.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "thirdRow",
              context: context);
        } else {
          // showSnackBarText(context,
          //     "You haven't striked 5 numbers in the top bottom row yet :(");
        }
        break;

      case ClaimType.tambola:
        if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "tambola",
              context: context);
        } else {
          // showSnackBarText(context, "You haven't completed the Tambola");
        }
        break;
    }
  }
}

//a widget for each individual chip to enable color change
class TambolaChip extends StatelessWidget {
  final int id;

  const TambolaChip({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            //change the gradient of the chip if number was called
            gradient: getGradient(),
            boxShadow: const [
              BoxShadow(offset: Offset(2, 4), blurRadius: 5, spreadRadius: 1)
            ]),
        child: Center(
          child: Text(
            id.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  //return the corresponding gradient if the color was called or not
  getGradient() {
    if (currentNumber == id) {
      return fireLinearGradient;
    } else if (calledNumbers.contains(id)) {
      return redLinear;
    } else {
      return blueGradient;
    }
  }
}

//widget for each user ticket item/number cell
class TicketItem extends StatefulWidget {
  final int id;
  final int rowNumber;
  final number;
  final bool isBlank;

  const TicketItem(
      {required this.id,
      required this.rowNumber,
      required this.number,
      this.isBlank = false,
      Key? key})
      : super(key: key);

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on tap check if number was called
      onTap: checkNumber,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3.0),
        duration: const Duration(milliseconds: 400),
        //determine the color of the ticket item if it is striked by the user
        // color:
        // isCrossed() ? Colors.red :
        // Colors.white,
        decoration: BoxDecoration(
            color:
                // isCrossed() ? Colors.red :
                Colors.white,
            image: isCrossed()
                ? DecorationImage(image: AssetImage("assets/images/Line.png"))
                : null),
        alignment: Alignment.center,
        child: Text(
          widget.number.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
          ),
        ),
      ),
    );
  }

  //check if number was called and update corresponding row list for keeping track of strikes
  checkNumber() async {
    // setState(() {
    if (calledNumbers.contains(widget.number)) {
      print(
          "CALLED NUMBER CONTAINS ONTAP NUMBER  ^ ${widget.number}  CONTAINS ROW ${widget.rowNumber}");
      Provider.of<GameProvider>(context, listen: false)
          .updateCrossedNumbers(widget.number);
      crossedNumbers.add(widget.number);

      if (!widget.isBlank &&
              randomTicket.first.contains(widget.number) &&
              // widget.rowNumber == 1 &&
              !row1.contains(widget.number)
          // )
          ) {
        row1.add(widget.number);
        log("SUCCESFULLY ADDED ROW [ 1 ] ${widget.number}");
        if (row1.length + row2.length + row3.length >= 5) {
          log("first five ");
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.firstFive,
          );
        }
        if (row1.length == 5) {
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.topRow,
          );
          if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
            log("CHECKING THE TAMBOLA CONDITION !!!");
            Provider.of<GameProvider>(context, listen: false).claimReady(
              claimType: ClaimType.tambola,
            );
          }
        }
      }
      if (!widget.isBlank &&
              randomTicket[1].contains(widget.number) &&
              !row2.contains(widget.number)

          // widget.rowNumber == 2 &&
          // !row2.contains(widget.number)
          ) {
        print("conditions apply");
        row2.add(widget.number);
        log("SUCCESFULLY ADDED ROW [ 2 ] ${widget.number}");
        if (row1.length + row2.length + row3.length >= 5) {
          log("first five ");
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.firstFive,
          );
        }
        if (row2.length == 5) {
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.middleRow,
          );
          if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
            log("CHECKING THE TAMBOLA CONDITION !!!");
            Provider.of<GameProvider>(context, listen: false).claimReady(
              claimType: ClaimType.tambola,
            );
          }
        }
      }
      if (!widget.isBlank &&
              randomTicket.last.contains(widget.number) &&
              !row3.contains(widget.number)

          // widget.rowNumber == 3 &&
          // !row3.contains(widget.number)
          ) {
        row3.add(widget.number);
        log("SUCCESFULLY ADDED ROW [ 3 ] ${widget.number}");
        if (row1.length + row2.length + row3.length >= 5) {
          log("first five ");
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.firstFive,
          );
        }
        if (row3.length == 5) {
          Provider.of<GameProvider>(context, listen: false).claimReady(
            claimType: ClaimType.bottomRow,
          );
          if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
            log("CHECKING THE TAMBOLA CONDITION !!!");
            Provider.of<GameProvider>(context, listen: false).claimReady(
              claimType: ClaimType.tambola,
            );
          }
        }
      }
    } else {
      // showSnackBarText(context, "The number wasn't called out yet");
    }
    // });
  }

  //check if number is called
  isCrossed() {
    return crossedNumbers.contains(widget.number);
  }
}
