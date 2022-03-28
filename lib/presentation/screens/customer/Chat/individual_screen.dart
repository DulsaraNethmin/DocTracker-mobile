import 'package:doctracker/data/model/chatModel.dart';
import 'package:flutter/material.dart';

class IndividualScreen extends StatefulWidget {
  IndividualScreen({required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 91, 57, 160),
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back,
              size: 20,
            ),
            CircleAvatar(
              radius: 20,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
    );
  }
}
