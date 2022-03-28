import 'package:doctracker/presentation/screens/customer/Chat/custom_card.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 91, 57, 160),
    title: Text("Mails"),
    elevation: 0,
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
      PopupMenuButton<String>(
        onSelected: (value) {
          print(value);
        },
        itemBuilder: (BuildContext contesxt) {
          return [
            PopupMenuItem(
              child: Text("New group"),
              value: "New group",
            ),
            PopupMenuItem(
              child: Text("New broadcast"),
              value: "New broadcast",
            ),
            PopupMenuItem(
              child: Text("Whatsapp Web"),
              value: "Whatsapp Web",
            ),
            PopupMenuItem(
              child: Text("Starred messages"),
              value: "Starred messages",
            ),
            PopupMenuItem(
              child: Text("Settings"),
              value: "Settings",
            ),
          ];
        },
      )
    ],
  );

  final actionBtn = FloatingActionButton(
    onPressed: () {},
    backgroundColor: Color.fromARGB(255, 91, 57, 160),
    child: Icon(
      Icons.chat,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      floatingActionButton: actionBtn,
      body: ListView(
        children: [
          CustomCard(),
          CustomCard(),
          CustomCard(),
          CustomCard(),
          CustomCard(),
          CustomCard(),
          CustomCard(),
        ],
      ),
    );
  }
}
