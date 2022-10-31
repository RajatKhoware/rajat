import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambola_frontend/controller/services/error_handling.dart';
import 'package:tambola_frontend/models/wallet_model.dart';
import 'package:http/http.dart' as http;
import 'package:tambola_frontend/view/constants/strings.dart';

class WalletServices {
  var client = http.Client();
  Map<String, String> header = {
    'Content-Type': 'application/json;charset=UTF-8'
  };
  Future<WalletModel> getWallet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    WalletModel? data;
    var url = Uri.tryParse(
      '$baseUri/user/getUserWallet',
    );
    try {
      var response = await client.post(url!,
          body: jsonEncode({"userId": userId}), headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            data = walletModelFromJson(response.body);
            print("is it working");
            print(response.body);
          });
      return data!;
    } catch (e) {}
    return data!;
  }
}
