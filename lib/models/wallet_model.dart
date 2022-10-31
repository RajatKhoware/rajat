// To parse this JSON data, do
//
//     final winnersModel = winnersModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
    this.id,
    this.ownerId,
    this.defaultAmount,
    this.userAddedAmount,
    this.winningAmount,
    this.totalUsableAmount,
    // this.createdAt,
    // this.updatedAt,
    // this.v,
  });

  final String? id;
  final String? ownerId;
  final num? defaultAmount;
  final num? userAddedAmount;
  final num? winningAmount;
  final num? totalUsableAmount;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // int? v;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json["_id"],
        ownerId: json["ownerId"],
        defaultAmount: json["defaultAmount"],
        userAddedAmount: json["userAddedAmount"],
        winningAmount: json["winningAmount"],
        totalUsableAmount: json["totalUsableAmount"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ownerId": ownerId,
        "defaultAmount": defaultAmount,
        "userAddedAmount": userAddedAmount,
        "winningAmount": winningAmount,
        "totalUsableAmount": totalUsableAmount,
        // "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
        // "__v": v,
      };
}
