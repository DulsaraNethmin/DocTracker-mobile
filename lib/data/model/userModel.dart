// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.username,
    required this.role,
    required this.branch,
  });

  final String uuid;
  final String name;
  final String email;
  final String username;
  final String role;
  final String branch;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        role: json["role"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "email": email,
        "username": username,
        "role": role,
        "branch": branch,
      };
}









// {
//   "uuid":"",
//   "name":"",
//   "email":"",
//   "usenmae":"",
//   "role":"",
//   "branch":""
// }