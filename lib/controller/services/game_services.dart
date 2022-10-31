// ignore_for_file:  use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/models/winners_model.dart';

List<List<int>> randomTicket = [];

class GameServices {
  var client = http.Client();
  SocketMethods _socketMethods = SocketMethods();
  Map<String, String> header = {
    'Content-Type': 'application/json;charset=UTF-8'
  };

  Future<bool> createMatch(
      {required String createdID,
      required String gameType,
      required int gameFee,
      required BuildContext context}) async {
    bool isSuccess = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    var url = Uri.tryParse(
      '$baseUri/room/creatematch',
    );
    try {
      print(gameType);
      Provider.of<GameProvider>(context, listen: false).setIsLoading(true);

      var response = await http.post(url!,
          body: jsonEncode(
              {"createrId": createdID, "type": gameType, "fee": gameFee}),
          headers: header);
      Provider.of<GameProvider>(context, listen: false).setIsLoading(false);

      log('Response status: ${response.statusCode}');
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final matchData = matchModelFromJson(response.body);
            debugPrint("NEW GAME CREATED && ID ${matchData.match.id}");
            _socketMethods.socketAddMatch(
                roomId: matchData.match.id, type: gameType, fee: gameFee);
                     Provider.of<GameProvider>(context, listen: false)
                            .setGameState(matchID: matchData.match.id);
            isSuccess = true;
          });
      // return isSuccess;
    } catch (e) {
      debugPrint('Response : $e');
    }
    return isSuccess;
  }

  Future<bool> joinMatch(
      {required String createdID,
      required String gameType,
      required int gameFee,
      required String matchID,
      // String? userID,
      required BuildContext context}) async {
    bool isSuccess = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");

    debugPrint("JOINING MATCH ID : $matchID");
    var url = Uri.tryParse(
      '$baseUri/room/joinmatch',
    );
    try {
      Provider.of<GameProvider>(context, listen: false).setIsLoading(true);

      var response = await http.post(url!,
          body: jsonEncode({"userId": userId, "matchId": matchID}),
          headers: header);
      Provider.of<GameProvider>(context, listen: false).setIsLoading(false);

      print(response.statusCode);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final matchData = matchModelFromJson(response.body);
            log("JOINED A NEW GAME && GAME MEMBERS ${matchData.match.members.toString()}");
            final matchType = matchData.match.type ?? 2;

            Provider.of<GameProvider>(context, listen: false)
                .setMatchType(matchType: matchType);
            if (matchData.match.members.length >= matchType) {
              Provider.of<GameProvider>(context, listen: false)
                  .changeStart(state: true);
            } else {
              Provider.of<GameProvider>(context, listen: false)
                  .setMemberStatus(state: true);
            }
            isSuccess = true;
          });
      if (response.statusCode == 400) {
        showSnackBarText(context, "created new game :)");
        await createMatch(
                createdID: userId!,
                gameType: gameType.toString(),
                gameFee: gameFee,
                context: context)
            .then((value) {
          if (value == true) isSuccess = true;
        });
        // showSnackBarText(context, "Game started :(");
        Provider.of<GameProvider>(context, listen: false)
            .setGameState(matchID: "");
      }
      return isSuccess;
    } catch (e) {
      debugPrint('Response : $e');
    }
    return isSuccess;
  }

  Future<bool> startMatch(
      {required String matchID, required BuildContext context}) async {
    bool isSuccess = false;
    log('INSIDE START MATCH METHOD :)');

    final activeUsers =
        Provider.of<GameProvider>(context, listen: false).activeUsers;

    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    var url = Uri.tryParse(
      '$baseUri/room/start',
    );
    try {
      var response = await http
          .post(url!, body: jsonEncode({"matchId": matchID}), headers: header)
          .then((response) async {
        httpErrorHandle(
            response: response,
            onSuccess: () async {
              // print(response.body);
              log("REST : START MATCH SUCCESS");
              final matchData = startGameDataFromJson(response.body);

              debugPrint(matchData.data.members.toString());
              final filter = matchData.data.members.toSet();
            });
        if (response.statusCode == 200 || response.statusCode == 201) {
          final matchData = startGameDataFromJson(response.body);
          final filter = matchData.data.members.toSet();

          final users = await filterUsers(
                  activeUsers: activeUsers, members: filter.toList())
              .then((users) {
            if (users != null) {
              debugPrint("FILTERING MEMBERS COMPLETE : ${users.toString()}");
              if (users.length >= matchData.data.members.length &&
                  users.isNotEmpty) {
                debugPrint(
                    "CHECKING THE MEMBERS LENGTH && DATA : ${users.length.toString()} <> ${matchData.data.draw.toString()}");
                isSuccess = true;
                Provider.of<GameProvider>(context, listen: false)
                    .setGameActive(listActiveUsers: users);
                Provider.of<GameProvider>(context, listen: false)
                    .setDraw(drawData: matchData.data.draw);
                print("U P D A T I N G     T O     STATE      ACTIVE&DRAW");
                // getTicket(
                //   // users: users,
                //   userID: userId!,
                //   matchID: matchID,
                //   // draw: matchData.data.draw
                // );

                SocketMethods().socketJoin(roomID: matchID, users: users);
                print("SOCKET JOIN SUCCESS");
                isSuccess = true;
              } else {
                // isSuccess = false;

              }
            }
          });
        }
      });
      print('RETURN START MATCH SUCCESS');
      return isSuccess;
    } catch (e) {
      debugPrint('Response : $e');
    }
    print('after bool $isSuccess');
    return isSuccess;
  }

  Future<bool> getTicket(
      {required String userID,
      // required List<String> users,
      required String matchID,
      // required List<int> draw
      required BuildContext context}) async {
    bool isSuccess = false;
    log("INSIDE GET TICKET METHOD  $userID    $matchID");
    var url = Uri.tryParse(
      '$baseUri/room/ticket',
    );
    try {
      print(matchID);
      Provider.of<GameProvider>(context, listen: false).setTicketLoading(true);
      var response = await http.post(url!,
          body: jsonEncode(
              {"userId": userID, "matchId": matchID, "ticketCount": 1}),
          headers: header);
      Provider.of<GameProvider>(context, listen: false).setTicketLoading(false);

      httpErrorHandle(
          response: response,
          onSuccess: () {
            final ticketData = ticketModelFromJson(response.body);
            if (ticketData.x.first.entries.isNotEmpty) {
              randomTicket = ticketData.x.first.entries;
              debugPrint("TICKET NOT EMPTY > > ${randomTicket.toString()}");
            }
            isSuccess = true;
            // SocketMethods().socketStart(
            //   draw: draw,
            //   roomID: matchID,
            //   users: users,
            // );
          },
          onError: () async {
            if (response.statusCode == 400) {
              showSnackBarText(context, "Insuffient Wallet Amount :(");
            } else {
              showSnackBarText(context, "Something went wrong !!!");
            }
          });

      return isSuccess;
    } catch (e) {
      debugPrint('Response : $e');
    }
    return isSuccess;
  }

  void claimWin({
    required String userID,
    required String matchID,
    required String claimType,
    required BuildContext context,
  }) async {
    var url = Uri.tryParse('$baseUri/room/claim/');
    try {
      var response = await http.post(url!,
          body: jsonEncode({
            "userId": userID,
            "matchId": matchID.trim(),
            "claimType": claimType.trim()
          }),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            log("REST : CLAIM SUCCESS !!!");

            showSnackBarText(context, "Congrats, You have won the $claimType!");

            SocketMethods().claimWin(
                roomID: matchID, userName: "USER NAME", claimType: claimType);
          });
      if (response.statusCode == 400) {
        showSnackBarText(context, "Already Claimed !!!");
      }
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  Future<bool> getWinners(
      {required String matchID, required BuildContext context}) async {
    bool isSuccess = false;

    var url = Uri.tryParse(
      '$baseUri/room/winner',
    );
    try {
      log("GET WINNERS ");

      var response = await http.post(url!,
          body: jsonEncode({"matchId": matchID}), headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            log("GET WINNERS SUCCESS");
            print(response.body);
            final winnersData = winnersModelFromJson(response.body);
            print(winnersData.tambola);
            Provider.of<GameProvider>(context, listen: false)
                .setWinnersState(data: winnersData);

            isSuccess = true;

            // showSnackBarText(context, "Game !!!");
          });
      return isSuccess;
    } catch (e) {
      debugPrint('Response : $e');
    }
    return isSuccess;
  }

  leaveGame({
    required String matchId,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId") ?? "";
    var url = Uri.tryParse(
      '$baseUri/room/leave',
    );

    try {
      var response = await http.post(url!,
          body: jsonEncode({"userId": userId, "matchId": matchId}),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            print(response.body);
            // return data;
          });
    } catch (e) {
      debugPrint('Response : $e ');
    } finally {
      // client.close();
    }
  }

  Stream<int> getMemberCount({
    required BuildContext context,
    required String matchId,
  }) async* {
    yield* Stream.periodic(Duration(seconds: 1), (_) {
      return getUserCount(context: context, matchId: matchId);
    }).asyncMap((event) async => await event);
  }

  Future<int> getUserCount({
    required BuildContext context,
    required String matchId,
  }) async {
    int numb = 0;

    var url = Uri.tryParse(
      '$baseUri/room/getMemberCount',
    );
    try {
      print(matchId);
      var response = await http.post(url!,
          body: jsonEncode({"matchId": matchId}), headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            print(response.body);
            numb = jsonDecode(response.body);
            // Provider.of<GameProvider>(context)
            //     .setEnteredMembers(value: jsonDecode(response.body));
            print(response.body);
            // return data;
          });
      return numb;
    } catch (e) {
      debugPrint('Response : $e');
    } finally {
      // client.close();
    }
    return numb;
  }

  Future<List<MatchData>> allMatch() async {
    List<MatchData> data = [];
    var url = Uri.tryParse(
      '$baseUri/room/allmatch',
    );
    try {
      var response = await http.get(url!);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final allData = AllMatchModel.fromJson(jsonDecode(response.body));
            debugPrint(
                "SERVER ALL MATCHES ARE ${allData.beta.length} , REMOVE AFTER DEBUG !!!");
            data = allData.beta;
            // return data;
          });
    } catch (e) {
      debugPrint('Response : $e');
    } finally {
      // client.close();
    }
    return data;
  }

  Future<List<String>?> filterUsers(
      {required List<SocketData> activeUsers,
      required List<String> members}) async {
    List<String> filterList = [];
    if (activeUsers.isEmpty || members.isEmpty) return null;
    await Future.forEach(activeUsers, (SocketData i) async {
      await Future.forEach(members, (String member) async {
        if (i.userId == member) {
          debugPrint("MEMEBERS MATCHING ${i.userId}");
          filterList.add(i.socketId);
        } else {
          log("USER ID NOT MATCHING :(");
        }
      });
    });
    log("RETURN FILTER LIST ${filterList.toString()}");
    return filterList;
  }
}
