// To parse this JSON data, do
//
//     final mail = mailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Mail> mailFromJson(String str) =>
    List<Mail>.from(json.decode(str).map((x) => Mail.fromJson(x)));

String mailToJson(List<Mail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mail {
  Mail({
    required this.mailId,
    required this.fromId,
    required this.fromName,
    required this.toId,
    required this.toName,
    required this.head,
    required this.body,
    required this.seen,
    required this.time,
  });

  final String mailId;
  final String fromId;
  final String fromName;
  final String toId;
  final String toName;
  final String head;
  final String body;
  final int seen;
  final DateTime time;

  factory Mail.fromJson(Map<String, dynamic> json) => Mail(
        mailId: json["mail_id"],
        fromId: json["from_id"],
        fromName: json["from_name"],
        toId: json["to_id"],
        toName: json["to_name"],
        head: json["head"],
        body: json["body"],
        seen: json["seen"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "mail_id": mailId,
        "from_id": fromId,
        "from_name": fromName,
        "to_id": toId,
        "to_name": toName,
        "head": head,
        "body": body,
        "seen": seen,
        "time":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
      };
}
