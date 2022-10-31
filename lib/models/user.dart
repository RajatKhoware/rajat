import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class User {
  User({
    required this.user,
    required this.token,
  });
  @HiveField(0)
  UserClass user;
  @HiveField(1)
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

@HiveType(typeId: 1)
class UserClass {
  UserClass({
    this.id,
    this.username,
    this.password,
    this.isAdmin,
    this.mobile,
    this.agreePrivacyPolicy,
    this.language,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  bool? isAdmin;
  @HiveField(4)
  int? mobile;
  @HiveField(5)
  bool? agreePrivacyPolicy;
  @HiveField(6)
  String? language;
  @HiveField(7)
  bool? isActive;
  @HiveField(8)
  DateTime? createdAt;
  @HiveField(9)
  DateTime? updatedAt;
  @HiveField(10)
  int? v;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        mobile: json["mobile"],
        agreePrivacyPolicy: json["AgreePrivacyPolicy"],
        language: json["language"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "password": password,
        "isAdmin": isAdmin,
        "mobile": mobile,
        "AgreePrivacyPolicy": agreePrivacyPolicy,
        "language": language,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
