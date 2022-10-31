import 'dart:convert';
import 'dart:math';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambola_frontend/controller/services/error_handling.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';
import 'package:tambola_frontend/controller/utils/showSnackBar.dart';
import 'package:tambola_frontend/models/paymentreq_model.dart';
import 'package:tambola_frontend/models/paymentres_model.dart';
import 'package:http/http.dart' as http;
import 'package:tambola_frontend/view/constants/export_main.dart';
import 'package:tambola_frontend/view/constants/strings.dart';

class PaymentSystem with BaseClass {
  var client = http.Client();
  Future payment(
      {required String orderId,
      required String orderAmount,
      required String tokenData,
      required BuildContext context}) async {
    String stage = "TEST";
    // String orderId = "123456";
    // String orderAmount = "10";
    // String tokenData =
    // "SP9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.6A9JiZ1AjN3EDN2UWY1MjNiojI0xWYz9lIskjN1MTO0kjN2EjOiAHelJCLiIlTJJiOik3YuVmcyV3QyVGZy9mIsICMxIiOiQnb19WbBJXZkJ3biwiI2UDNzITMiojIklkclRmcvJye.72m6v9Hrp8hqp_BO87bubksMYLMJksrMT9k0g5cHVihuQ5wWAAlF6l_MCh2zyyNcnO";
    ;
    String customerName = "Rahul";
    String orderCurrency = "INR";
    String appId = "222083e7bd2394977d36b0a67b380222";
    String customerPhone = "8592962084";
    String customerEmail = "meraulhere@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";
    String orderNote = "Order Note";
    Map<String, String> inputParams = {
      "color1": "1803a1",
      "color2": "FFFFFF",
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "tokenData": tokenData,
      "stage": stage,
      "notifyUrl": notifyUrl
    };
    CashfreePGSDK.doPayment(inputParams).then((value) {
      print(value);
      var resp = paymentResModelFromJson(jsonEncode(value));
      restReq(amount: resp.orderAmount, context: context);
      value?.forEach((key, value) {
        print("$key : $value");
        //Do something with the result
      });
    });
  }

  Future makePayment(
      {required String amount, required BuildContext context}) async {
    Navigator.of(context).pop();
    showLoader(context);
    Random random2 = Random.secure();
    var _randomNumber2 = random2.nextInt(999999999);
    var url = Uri.tryParse(
      'https://test.cashfree.com/api/v2/cftoken/order',
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      // "authorization": "Bearer ${token}"
      "x-client-id": "222083e7bd2394977d36b0a67b380222",
      "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };
    print("MAKE PAYMENT $amount");
    try {
      var response = await http.post(url!,
          body: jsonEncode({
            "orderId": _randomNumber2.toString(),
            "orderAmount": amount,
            "orderCurrency": "INR"
          }),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            var resp = paymentReqModelFromJson(response.body);
            print(resp.cftoken);
            payment(
                orderAmount: amount,
                orderId: _randomNumber2.toString(),
                tokenData: resp.cftoken,
                context: context);
          });
    } catch (e) {}
  }

  Future restReq(
      {required String amount, required BuildContext context}) async {
    var url = Uri.tryParse(
      '$baseUri/cashinout/payment',
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userID");
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      // "authorization": "Bearer ${token}"
      // "x-client-id": "222083e7bd2394977d36b0a67b380222",
      // "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };

    try {
      var response = await http.post(url!,
          body: jsonEncode({"amount": amount, "userId": userId}),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            Navigator.of(context).pop();

            showSnackBarText(context, "Wallet amount successfully credited");
            print(response.body);
          });
    } catch (e) {}
  }

  Future payout({
    required String amount,
  }) async {
    var url = Uri.tryParse(
      '$baseUri/cashinout/payout',
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userID");
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      // "authorization": "Bearer ${token}"
      // "x-client-id": "222083e7bd2394977d36b0a67b380222",
      // "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };
    print("MAKE PAYMENT $amount");
    try {
      var response = await http.post(url!,
          body: jsonEncode({"amount": amount, "userId": userId}),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            print(response.body);
          });
    } catch (e) {}
  }
  //! //////////////////////////

  Future makePayout(
      {required String amount, required BuildContext context}) async {
    Navigator.of(context).pop();
    showLoader(context);
    var url = Uri.tryParse(
      'https://payout-api.cashfree.com/payout/v1/authorize',
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      // "authorization": "Bearer ${token}"
      "x-client-id": "222083e7bd2394977d36b0a67b380222",
      "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };
    print("MAKE PAYOUT $amount");
    try {
      var response = await http.post(url!,
          // body: jsonEncode({
          //   "orderId": _randomNumber2.toString(),
          //   "orderAmount": amount,
          //   "orderCurrency": "INR"
          // }),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            // var resp = paymentReqModelFromJson(response.body);
            // print(resp.cftoken);
          });
    } catch (e) {}
  }

// * add beneficiary
  Future addBeneficiary(
      {required String amount,
      required String token,
      required BuildContext context}) async {
    Navigator.of(context).pop();
    var url = Uri.tryParse(
      'https://payout-api.cashfree.com/payout/v1/addBeneficiary',
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      "authorization": "Bearer ${token}"
      // "x-client-id": "222083e7bd2394977d36b0a67b380222",
      // "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };
    print("beneficiary $amount");
    try {
      var response = await http.post(url!,
          body: jsonEncode({
            {
              "beneId": "JOHN18011343",
              "name": "john doe",
              "email": "johndoe@cashfree.com",
              "phone": "9876543210",
              "bankAccount": "00111122233",
              "ifsc": "HDFC0000001",
              "address1": "ABC Street",
              "city": "Bangalore",
              "state": "Karnataka",
              "pincode": "560001"
            }
          }),
          headers: header);
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {}
  }

  // * req transfer
  Future reqTransfer(
      {required String amount,
      required String token,
      required BuildContext context}) async {
    Navigator.of(context).pop();
    showLoader(context);
    var url = Uri.tryParse(
      'https://payout-api.cashfree.com/payout/v1/requestTransfer',
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      "authorization": "Bearer ${token}"
      // "x-client-id": "222083e7bd2394977d36b0a67b380222",
      // "x-client-secret": "fe5cfec1a342d462f9baa1e36af3523c611e1c24"
    };
    print("beneficiary $amount");
    try {
      var response = await http.post(url!,
          body: jsonEncode({
            {
              "beneId": "JOHN18011343",
              "amount": "1.00",
              "transferId": "JUNOB2018"
            }
          }),
          headers: header);
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {}
  }
}
