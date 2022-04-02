import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/presentation/screens/customer/Chat/own_message_card.dart';
import 'package:doctracker/presentation/screens/customer/Chat/reply_card.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualScreen extends StatefulWidget {
  IndividualScreen({required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  late IO.Socket socket;
  AppBar appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 91, 57, 160),
      leadingWidth: 70,
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
              child: Image.asset(widget.chatModel.icon),
              radius: 20,
            )
          ],
        ),
      ),
      title: Text(
        widget.chatModel.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
      ),
    );
  }

  Container body(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 199, 181, 236),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 140,
            child: ListView(
              shrinkWrap: true,
              children: [
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Card(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          //textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message...',
                              contentPadding: EdgeInsets.all(7)),
                        ))),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, right: 5, left: 5),
                  child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 91, 57, 160),
                      radius: 25,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello2");
    connect();
  }

  void connect() {
    socket = IO.io("http://192.168.56.1:8000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    print("inside");
    socket.connect();
    socket.emit('/test', "I Connnect to the lobby");
    socket.onConnect((data) {
      print("connected");
    });
    print(socket.connected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: body(context),
    );
  }
}
