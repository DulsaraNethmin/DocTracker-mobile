import 'package:doctracker/data/model/messageModel.dart';

class Chat {
  String name;
  String icon;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  String id;
  List<Message> message;
  Chat({
    required this.name,
    required this.icon,
    required this.time,
    required this.currentMessage,
    required this.status,
    this.select = false,
    required this.id,
    required this.message,
  });
}
