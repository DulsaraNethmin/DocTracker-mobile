// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.username,
    required this.role,
    required this.branch,
    required this.branchId,
    required this.image_url,
    required this.token,
  });

  final String uuid;
  final String name;
  final String email;
  final String username;
  final String role;
  final String branch;
  final String branchId;
  final String image_url;
  final String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        role: json["role"],
        branch: json["branch"],
        branchId: json["branchId"],
        image_url: json["image_url"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "email": email,
        "username": username,
        "role": role,
        "branch": branch,
        "branchId": branchId,
        "image_url": image_url,
        "token": token,
      };
}
