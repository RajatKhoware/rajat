// To parse this JSON data, do
//
//     final winnersModel = winnersModelFromJson(jsonString);

import 'dart:convert';

WinnersModel winnersModelFromJson(String str) =>
    WinnersModel.fromJson(json.decode(str));

String winnersModelToJson(WinnersModel data) => json.encode(data.toJson());

class WinnersModel {
  WinnersModel({
    this.tambola,
    this.corner,
    this.thirdRow,
    this.firstRow,
    this.secondRow,
  });

  final String? tambola;
  final String? corner;
  final String? thirdRow;
  final String? firstRow;
  final String? secondRow;

  factory WinnersModel.fromJson(Map<String, dynamic> json) => WinnersModel(
        tambola: json["Tambola"],
        corner: json["Corner"],
        thirdRow: json["ThirdRow"],
        firstRow: json["FirstRow"],
        secondRow: json["SecondRow"],
      );

  Map<String, dynamic> toJson() => {
        "Tambola": tambola,
        "Corner": corner,
        "ThirdRow": thirdRow,
        "FirstRow": firstRow,
        "SecondRow": secondRow,
      };
}
