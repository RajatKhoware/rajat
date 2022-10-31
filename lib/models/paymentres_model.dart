// To parse this JSON data, do
//
//     final paymentResModel = paymentResModelFromJson(jsonString);

import 'dart:convert';

PaymentResModel paymentResModelFromJson(String str) =>
    PaymentResModel.fromJson(json.decode(str));

String paymentResModelToJson(PaymentResModel data) =>
    json.encode(data.toJson());

class PaymentResModel {
  PaymentResModel({
    required this.txStatus,
    required this.orderAmount,
    required this.paymentMode,
    required this.orderId,
    required this.txTime,
    required this.signature,
    required this.txMsg,
    required this.type,
    required this.referenceId,
  });

  String txStatus;
  String orderAmount;
  String paymentMode;
  String orderId;
  DateTime txTime;
  String signature;
  String txMsg;
  String type;
  String referenceId;

  factory PaymentResModel.fromJson(Map<String, dynamic> json) =>
      PaymentResModel(
        txStatus: json["txStatus"],
        orderAmount: json["orderAmount"],
        paymentMode: json["paymentMode"],
        orderId: json["orderId"],
        txTime: DateTime.parse(json["txTime"]),
        signature: json["signature"],
        txMsg: json["txMsg"],
        type: json["type"],
        referenceId: json["referenceId"],
      );

  Map<String, dynamic> toJson() => {
        "txStatus": txStatus,
        "orderAmount": orderAmount,
        "paymentMode": paymentMode,
        "orderId": orderId,
        "txTime": txTime.toIso8601String(),
        "signature": signature,
        "txMsg": txMsg,
        "type": type,
        "referenceId": referenceId,
      };
}
