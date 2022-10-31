// To parse this JSON data, do
//
//     final startGameData = startGameDataFromJson(jsonString);

import 'dart:convert';

StartGameData startGameDataFromJson(String str) =>
    StartGameData.fromJson(json.decode(str));

String startGameDataToJson(StartGameData data) => json.encode(data.toJson());

class StartGameData {
  StartGameData({
    required this.data,
  });

  final Data data;

  factory StartGameData.fromJson(Map<String, dynamic> json) => StartGameData(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.members,
    required this.draw,
    required this.createrId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  List<String> members;
  List<int> draw;
  String createrId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        members: List<String>.from(json["members"].map((x) => x)),
        draw: List<int>.from(json["draw"].map((x) => x)),
        createrId: json["createrId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "members": List<dynamic>.from(members.map((x) => x)),
        "draw": List<dynamic>.from(draw.map((x) => x)),
        "createrId": createrId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
