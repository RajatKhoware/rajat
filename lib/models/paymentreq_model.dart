// To parse this JSON data, do
//
//     final paymentReqModel = paymentReqModelFromJson(jsonString);

import 'dart:convert';

PaymentReqModel paymentReqModelFromJson(String str) =>
    PaymentReqModel.fromJson(json.decode(str));

String paymentReqModelToJson(PaymentReqModel data) =>
    json.encode(data.toJson());

class PaymentReqModel {
  PaymentReqModel({
    required this.status,
    required this.message,
    required this.cftoken,
  });

  final String status;
  final String message;
  final String cftoken;

  factory PaymentReqModel.fromJson(Map<String, dynamic> json) =>
      PaymentReqModel(
        status: json["status"],
        message: json["message"],
        cftoken: json["cftoken"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cftoken": cftoken,
      };
}
