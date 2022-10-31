// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tambola_frontend/controller/audio/audio.dart';
import 'package:tambola_frontend/controller/local_db/local_db.dart';
import 'package:tambola_frontend/view/constants/export.dart';
import 'package:tambola_frontend/models/user.dart';

class AuthService {
  Future<dynamic> signUpWithPhone(
      {required BuildContext context,
      required String name,
      required String mobile,
      required String password,
      required bool isAgreed}) async {
    try {
      // final user = UserClass(
      //     username: name, mobile: int.parse(mobile), password: password);
      // debugPrint(user.username);

      http.Response res = await http.post(
        Uri.parse('$baseUri/auth/register'),
        body: jsonEncode //user.toJson(),
            ({
          "authType": "Local",
          "username": name,
          "mobile": mobile,
          "password": password,
          "AgreePrivacyPolicy": isAgreed
        }),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          onSuccess: () {
            debugPrint("Signed in successfully!");
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          });
      if (res.statusCode != 200) {
        showSnackBarText(context, "something went wrong !!!");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<dynamic> signInWithUsernameOrPhone(
      {required String username,
      required String password,
      required BuildContext context}) async {
    bool isSignupSuccess = false;
    var response = await http.post(Uri.parse('$baseUri/auth/login'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        });

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    httpErrorHandle(
        response: response,
        onSuccess: () async {
          // await LocalData.setMusic(true);
          final User user = userFromJson(response.body);
          await LocalData().addLocal(user);
          await LocalData().getLocal(context);
          print("TOCKEN ${user.token}");
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString('x-auth-token', user.token);
          await preferences.setString("userID", user.user.id!);
          debugPrint(preferences.getString('userID').toString());

          // Navigator.pushNamedAndRemoveUntil(
          //     context, '/select-room', (route) => false);
          await Future.delayed(Duration(seconds: 3), () async {
            Navigator.pushNamedAndRemoveUntil(
                context, "/bottom-bar", (route) => false);
          });
        });
    // Navigator.pushNamed(context, '/select-room');
    if (response.statusCode == 400) {
      showSnackBarText(context, "Wrong Password !!!");
      showSnackBarText(context, "enter the currect password");
    }
    if (response.statusCode == 404) {
      showSnackBarText(context, "User Not Found !!!");
    }
    if (response.statusCode != 404 &&
        response.statusCode != 400 &&
        response.statusCode != 200 &&
        response.statusCode != 201) {
      showSnackBarText(context, "Something Went wrong !!!");
    }
  }

  Future<dynamic> signOutUser(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('x-auth-token');
    preferences.remove("userID");
    Navigator.pushNamed(context, '/sign-up-start');
    await LocalData().delete();
    SocketMethods().disposeSocket();
    AudioManager.dispose();
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var isTokenExist = preferences.containsKey('x-auth-token');
    return isTokenExist;
  }
}
