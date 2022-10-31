import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tambola_frontend/models/match_data.dart';

class HandleMatch {
  Future addLocal(String data, String key) async {
    log("The Local Match data Key  $key");
    var box = await Hive.openBox<GlobalMatchData>("matchData");
    // await box.clear();
    await box.put(key, GlobalMatchData(matchId: data));
    var val = await box.get(key);
    print(val);
  }

  Future<GlobalMatchData?> getLocal(BuildContext context, String key) async {
    print("getting matchData $key");
    var box = await Hive.openBox<GlobalMatchData>('matchData');
    print(box.keys.toString());

    var val = await box.get(key);
    print(val);
    if (val != null) {
      log("Match DATA NOT NULL");
      // Provider.of<UserProvider>(context, listen: false).();
      print(val.toString());
    }
    return val;
  }

  Future<void> clearLocal() async {
    var box = await Hive.openBox<GlobalMatchData>("matchData");
    print(box.keys.toString());
    await box.clear();
  }
}
