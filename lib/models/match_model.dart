// To parse this JSON data, do
//
//     final matchModel = matchModelFromJson(jsonString);

import 'dart:convert';

AllMatchModel allMatchModelFromJson(String str) =>
    AllMatchModel.fromJson(json.decode(str));

String allMatchModelToJson(AllMatchModel data) => json.encode(data.toJson());

class AllMatchModel {
  AllMatchModel({
    required this.beta,
  });

  List<MatchData> beta;

  factory AllMatchModel.fromJson(Map<String, dynamic> json) => AllMatchModel(
        beta: List<MatchData>.from(
            json["beta"].map((x) => MatchData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "beta": List<dynamic>.from(beta.map((x) => x.toJson())),
      };
}

class MatchData {
  MatchData({
    required this.id,
    required this.members,
    required this.draw,
    required this.createrId,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  List<String?>? members;
  List<int?> draw;
  String createrId;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory MatchData.fromJson(Map<String, dynamic> json) => MatchData(
        id: json["_id"],
        members: List<String?>.from(json["members"].map((x) => x)),
        draw: List<int?>.from(json["draw"].map((x) => x)),
        createrId: json["createrId"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "members": List<dynamic>.from(members!.map((x) => x)),
        "draw": List<dynamic>.from(draw.map((x) => x)),
        "createrId": createrId,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

MatchModel matchModelFromJson(String str) =>
    MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  MatchModel({
    required this.match,
  });

  Match match;

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        match: Match.fromJson(json["match"]),
      );

  Map<String, dynamic> toJson() => {
        "match": match.toJson(),
      };
}

class Match {
  Match({
    required this.members,
    required this.draw,
    required this.id,
    required this.createrId,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<dynamic> members;
  List<dynamic> draw;
  String? createrId;
  String id;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        members: List<dynamic>.from(json["members"].map((x) => x)),
        draw: List<dynamic>.from(json["draw"].map((x) => x)),
        id: json["_id"],
        // type: json['type'],
        createrId: json["createrId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "members": List<dynamic>.from(members.map((x) => x)),
        "draw": List<dynamic>.from(draw.map((x) => x)),
        "_id": id,
        "createrId": createrId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
