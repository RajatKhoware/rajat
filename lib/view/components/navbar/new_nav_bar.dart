// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/audio/audio.dart';
import 'package:tambola_frontend/controller/local_db/local_db.dart';
import 'package:tambola_frontend/controller/local_db/match_handling.dart';
import 'package:tambola_frontend/controller/resources/socket_methods.dart';

import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/account_screen.dart';
import 'package:tambola_frontend/view/screens/WalletCard/wallet_card.dart';
import 'package:tambola_frontend/view/screens/WinnerList/winner_list.dart';
import 'package:tambola_frontend/view/screens/leader_board/presentation/screens/leaderboard_screen.dart';
import '../../../controller/providers/game_provider.dart';
import '../../screens/PlayRoom/select_room_screen.dart';

class NewNavBar extends StatefulWidget {
  const NewNavBar({Key? key}) : super(key: key);

  @override
  State<NewNavBar> createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar> {
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );

    return exitResult ?? false;
  }

  @override
  void initState() {
    AudioManager.player.onPlayerStateChanged.listen((state) {
      Provider.of<GameProvider>(context, listen: false)
          .setIsBGM(state == PlayerState.playing);
      //  PlayerState.playing;
    });
    super.initState();
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
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () async {
            await HandleMatch().clearLocal();
            Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
      ],
    );
  }

  int index = 0;
  final screens = [
    SelectRoomScreen(),
    NewWallet(),
    LeaderboardScreen(),
    AccountScreen(),
  ];
  @override
  void dispose() {
    AudioManager.dispose();
    SocketMethods().disposeSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SocketMethods().checkConnction(context);
      if (!Provider.of<GameProvider>(context, listen: false)
          .isSocketConnected) {
        SocketMethods().connectToServer(context: context);
      }
      // SocketMethods().connectToServer(context: context);
      if (!Provider.of<GameProvider>(context, listen: false).isBGMplaying
          //  &&
          // await LocalData.getMusic()
          ) {
        log("MUSIC CONDIONS TRUE");
        await AudioManager.play();
        Provider.of<GameProvider>(context, listen: false).setIsBGM(true);
      }
      // FlameAudio.bgm.play("bgm.mp3");

      String finishedID =
          Provider.of<GameProvider>(context, listen: false).finishedMatchId;
      String matchID =
          Provider.of<GameProvider>(context, listen: false).matchId;
      if (finishedID == matchID) {
        Provider.of<GameProvider>(context, listen: false)
            .setGameState(matchID: "");
      } else {
        // Provider.of<GameProvider>(context, listen: false)
        //     .setGameState(matchID: data[0]);
      }
    });

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          body: screens[index],
          bottomNavigationBar: Container(
            height: 94,
            decoration: BoxDecoration(gradient: blueLiner2Gradient),
            child: NavigationBar(
                backgroundColor: Colors.transparent,
                height: 94,
                selectedIndex: index,
                animationDuration: Duration(seconds: 15),
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: [
                  NewNavBarItems(
                      icon: (Icons.play_circle),
                      selectedIcon: (Icons.play_circle)),
                  NewNavBarItems(
                      icon: (Icons.wallet), selectedIcon: (Icons.wallet)),
                  NewNavBarItems(
                      icon: (Icons.analytics), selectedIcon: (Icons.analytics)),
                  NewNavBarItems(
                      icon: (Icons.account_box),
                      selectedIcon: (Icons.account_box))
                ]),
          ),
        ),
      ),
    );
  }
}

class NewNavBarItems extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  const NewNavBarItems({
    Key? key,
    required this.icon,
    required this.selectedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: Container(
        width: 63,
        height: 74,
        decoration: BoxDecoration(
            gradient: blackLinear, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: NavigationDestination(
            icon: Icon(
              icon,
              size: 50,
              color: Color.fromARGB(255, 199, 192, 192),
            ),
            label: "",
            selectedIcon: Container(
                decoration: BoxDecoration(),
                child: Icon(
                  selectedIcon,
                  size: 50,
                  color: Color.fromARGB(255, 255, 166, 0),
                )),
          ),
        ),
      ),
    );
  }
}
