class ChatModel {
  String name;
  String icon;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  String id;
  ChatModel({
    required this.name,
    required this.icon,
    required this.time,
    required this.currentMessage,
    required this.status,
    this.select = false,
    required this.id,
  });
}
