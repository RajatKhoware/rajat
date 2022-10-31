// ignore_for_file: avoid_print, unused_import

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/models/socket_data.dart';
import 'package:tambola_frontend/models/ticket_model.dart';
import 'package:tambola_frontend/models/winners_model.dart';
import 'package:tambola_frontend/controller/resources/socket_methods.dart';
import 'package:tambola_frontend/view/screens/Game/tambola_board.dart';
import 'package:tambola_frontend/view/screens/WinnerList/winner_list.dart';

class GameProvider extends ChangeNotifier {
  List<dynamic> _draw = [];
  List<SocketData> _activeUsers = [];
  List<String> _gameActive = [];
  List<dynamic> _gameCrossedNumbers = [];
  int _currentDrawValue = 0;
  String _gameStateMatchId = "";
  int _gameStateMatchType = 2;
  String _finishedMatchId = "";
  TicketModel gameTicket = TicketModel(x: []);
  List<int> gameCalledNumbers = [];
  bool _isStart = false;
  bool _isMember = false;
  WinnersModel _winnersState = WinnersModel(
      corner: "", firstRow: "", secondRow: "", tambola: "", thirdRow: "");
  int _enteredMembers = 0;
  int _winTambolaAmt = 0;
  int _winOtherAmt = 0;
  bool _isSocketConnected = false;

//claim colors
  Color _topRowC = kBlackLinear1;
  Color _middleRowC = kBlackLinear1;
  Color _bottomRowC = kBlackLinear1;
  Color _firstFiveC = kBlackLinear1;
  Color _tambolaC = kBlackLinear1;

//is claimed
  bool _isClaimedTopRow = false;
  bool _isClaimedMiddleRow = false;
  bool _isClaimedBottomRow = false;
  bool _isClaimedFirstFive = false;
  bool _isClaimedTambola = false;

  //* game loaders
  bool _isTicketLoading = false;
  bool get isTicketLoading => _isTicketLoading;
  void setTicketLoading(bool value) {
    _isTicketLoading = value;
    notifyListeners();
  }

  //audio listener
  bool _isBGMplaying = false;
  bool get isBGMplaying => _isBGMplaying;
  bool get isSocketConnected => _isSocketConnected;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSocketStatus(bool value) {
    _isSocketConnected = value;
    notifyListeners();
  }

  Color get topRowC => _topRowC;
  Color get middleRowC => _middleRowC;
  Color get bottomRowC => _bottomRowC;
  Color get firstFiveC => _firstFiveC;
  Color get tambolaC => _tambolaC;

  List<dynamic> get draw => _draw;
  List<SocketData> get activeUsers => _activeUsers;
  List<String> get gameActive => _gameActive;
  WinnersModel get winnersState => _winnersState;

  int get currentValue => _currentDrawValue;
  String get matchId => _gameStateMatchId;
  int get matchType => _gameStateMatchType;
  String get finishedMatchId => _finishedMatchId;
  bool get isStart => _isStart;
  bool get isMember => _isMember;
  bool get isClaimedTambola => _isClaimedTambola;
  bool get isClaimedFirstFive => _isClaimedTambola;
  bool get isClaimedTop => _isClaimedTambola;
  bool get isClaimedBottom => _isClaimedTambola;
  bool get isClaimedMiddle => _isClaimedTambola;
  int get enteredMembers => _enteredMembers;
  int get winTambola => _winTambolaAmt;
  int get winOther => _winOtherAmt;
  void addDraw({required List<int> draw}) {
    draw = draw;
    notifyListeners();
  }

  void setActiveUsers({required List<SocketData> listActiveUsers}) {
    _activeUsers = listActiveUsers;
    print("setting active users $activeUsers");
    notifyListeners();
  }

  void setGameActive({required List<String> listActiveUsers}) {
    _gameActive = listActiveUsers;
    print("setting  users $_gameActive");
    notifyListeners();
  }

  void setDraw({required List<dynamic> drawData}) {
    _draw = drawData;
    print("DRAW STATE $_draw");
    notifyListeners();
  }

  void changeStart({required bool state}) {
    _isStart = state;
    notifyListeners();
  }

  void setMemberStatus({required bool state}) {
    _isMember = state;
    notifyListeners();
  }

  void updateCurrentValue({required int value}) {
    _currentDrawValue = value;
    print("updated DRAW VALUE $_currentDrawValue");
    notifyListeners();
  }

  void setWinAmts({required int value, required int otherVal}) {
    log(value.toString());
    _winTambolaAmt = value;
    _winOtherAmt = otherVal;
    notifyListeners();
  }

  void setEnteredMembers({required int value}) {
    log(value.toString());
    _enteredMembers = value;
    print("$_enteredMembers");
    notifyListeners();
  }

  void updateCrossedNumbers(num value) {
    _gameCrossedNumbers.add(value);
    notifyListeners();
  }

  void setGameState({required String matchID}) {
    _gameStateMatchId = matchID;
    print("State Match ID $_gameStateMatchId");
    notifyListeners();
  }

  void setMatchType({required int matchType}) {
    _gameStateMatchType = matchType;
    print("State Match type$_gameStateMatchType");
    notifyListeners();
  }

  void setWinnersState({required WinnersModel data}) {
    _winnersState = data;
    print(" STATE $_draw");
    notifyListeners();
  }

  void setFinishedGameState({required String matchID}) {
    _finishedMatchId = matchID;
    print("Finished Match ID $_gameStateMatchId");
    notifyListeners();
  }

  setIsBGM(bool val) {
    _isBGMplaying = val;
    notifyListeners();
  }

  setGameStateBegin() {
    _topRowC = kBlackLinear1;
    _middleRowC = kBlackLinear1;
    _bottomRowC = kBlackLinear1;
    _firstFiveC = kBlackLinear1;
    _tambolaC = kBlackLinear1;

    _isClaimedTopRow = false;
    _isClaimedMiddleRow = false;
    _isClaimedBottomRow = false;
    _isClaimedFirstFive = false;
    _isClaimedTambola = false;
    _winTambolaAmt = 0;
    _winOtherAmt = 0;

    draw.clear();
    _gameCrossedNumbers.clear();
    _currentDrawValue = 0;
    _isStart = false;
    _isMember = false;
    _enteredMembers = 0;
    notifyListeners();
  }

  void claimReady({required ClaimType claimType}) {
    // final ticket = gameTicket.x.first.entries;
    // List<int> calledNum = gameCalledNumbers;
    if (!_isClaimedTopRow && claimType == ClaimType.topRow) {
      _topRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedMiddleRow && claimType == ClaimType.middleRow) {
      _middleRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedBottomRow && claimType == ClaimType.bottomRow) {
      _bottomRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedFirstFive && claimType == ClaimType.firstFive) {
      _firstFiveC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedTambola && claimType == ClaimType.tambola) {
      _tambolaC = kBlueClaimReady;
      notifyListeners();
    }
  }

  void setClaim({required String claimType, required BuildContext context}) {
    print("READY FOR CLAIMED COLOR CHANGE  $claimType");
    if (claimType == "corner") {
      _firstFiveC = kRedLinearColor1;
      _isClaimedFirstFive = true;
      notifyListeners();
    } else if (claimType == "firstRow") {
      _topRowC = kRedLinearColor1;
      _isClaimedTopRow = true;
      notifyListeners();
    } else if (claimType == "secondRow") {
      _middleRowC = kRedLinearColor1;
      _isClaimedMiddleRow = true;
      notifyListeners();
      print("second row chip color RED");
    } else if (claimType == "thirdRow") {
      _bottomRowC = kRedLinearColor1;
      _isClaimedBottomRow = true;
      notifyListeners();
    } else if (claimType == "tambola") {
      _tambolaC = kRedLinearColor1;
      _isClaimedTambola = true;
      notifyListeners();
      String matchId =
          Provider.of<GameProvider>(context, listen: false).matchId;
      Future.delayed(Duration(seconds: 8)).then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/winners-list", (Route<dynamic> route) => route.isFirst,
            arguments: ArgWinnerList(matchID: matchId));
      });
      Provider.of<GameProvider>(context, listen: false)
          .setGameState(matchID: "");
    }
  }



  //! ///////////////////////////////////////
  // String _matchId

}
