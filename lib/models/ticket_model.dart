// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    required this.x,
  });

  List<X> x;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        x: List<X>.from(json["x"].map((x) => X.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "x": List<dynamic>.from(x.map((x) => x.toJson())),
      };
}

class X {
  X({
    required this.entries,
  });

  List<List<int>> entries;

  factory X.fromJson(Map<String, dynamic> json) => X(
        entries: List<List<int>>.from(
            json["_entries"].map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "_entries": List<dynamic>.from(
            entries.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
