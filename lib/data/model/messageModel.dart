import 'package:flutter/material.dart';

class Message {
  String from;
  String to;
  String type;
  String message;
  String time;
  Message(
      {required this.from,
      required this.to,
      required this.message,
      required this.type,
      required this.time});
}
