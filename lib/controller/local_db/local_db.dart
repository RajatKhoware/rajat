import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/models/user.dart';

class LocalData {
  String LOCAL_DATA = "localData";
  Future addLocal(User data) async {
    var box = await Hive.openBox<User>("data");
    // await box.clear();
    await box.put(LOCAL_DATA, data);
  }

  Future<User?> getLocal(BuildContext context) async {
    print("getting local");
    var box = await Hive.openBox<User>('data');
    var val = await box.get(LOCAL_DATA);
    print(val?.token);
    if (val != null) {
      log("USER DATA NOT NULL");
      Provider.of<UserProvider>(context, listen: false).setUser(val);
      print(val.toString());
    }
    return val;
  }

  Future delete() async {
    var box = await Hive.openBox<User>('data');
    await box.delete(LOCAL_DATA);
    box.clear();
    // box.close();
    // print(val.toString());
  }

  static Future<void> setMusic(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("music", value);
  }

  static Future<bool> getMusic() async {
    bool? value = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("music") != null) value = pref.getBool("music");
    print("bool success");
    return value!;
  }
}
