// To parse this JSON data, do
//
//     final socketData = socketDataFromJson(jsonString);

import 'dart:convert';

List<SocketData> socketDataFromJson(String str) =>
    List<SocketData>.from(json.decode(str).map((x) => SocketData.fromJson(x)));

String socketDataToJson(List<SocketData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocketData {
  SocketData({
    required this.userId,
    required this.socketId,
  });

  final String userId;
  final String socketId;

  factory SocketData.fromJson(Map<String, dynamic> json) => SocketData(
        userId: json["userId"],
        socketId: json["socketId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "socketId": socketId,
      };
}
