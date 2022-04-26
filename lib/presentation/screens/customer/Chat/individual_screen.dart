import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/messageModel.dart';
import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/customer/Chat/own_message_card.dart';
import 'package:doctracker/presentation/screens/customer/Chat/reply_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualScreen extends StatefulWidget {
  IndividualScreen({required this.user});
  final User user;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  late IO.Socket socket;
  final _message_controller = TextEditingController();
  final _head_controller = TextEditingController();
  final _body_controller = TextEditingController();
  List<Message> messages = [];
  ScrollController _scrollController = ScrollController();

  //app bar......................................................................................
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
              child: Image.asset('assets/images/profile.png'),
              radius: 20,
            )
          ],
        ),
      ),
      title: Text(
        widget.user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
      ),
    );
  }

//body............................................................................................

  Container mail_head() {
    return Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
            margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              //textAlignVertical: TextAlignVertical.center,
              controller: _head_controller,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Mail Head',
                  contentPadding: EdgeInsets.all(7)),
            )));
  }

  Container mail_body() {
    return Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
            margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              //textAlignVertical: TextAlignVertical.center,
              controller: _body_controller,
              keyboardType: TextInputType.multiline,
              maxLines: 100,
              minLines: 20,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message...',
                  contentPadding: EdgeInsets.all(7)),
            )));
  }

  void sendMail(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    final data = {
      "from": (user_state is UserLogedin) ? user_state.uuid : "000",
      "to": widget.user.uuid,
      "time": DateTime.now().toString().substring(0, 19),
      "seen": false,
      "head": _head_controller.text,
      "body": _body_controller.text
    };
    print(data);
    //post mail to db
    //emit event
    //add mail to arr
    //navigate to chat screen
  }

  MaterialButton mail_button(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        sendMail(context);
      },
      child: Text(
        'Send Mail',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      minWidth: MediaQuery.of(context).size.width - 60,
      color: Color.fromARGB(255, 203, 51, 226),
    );
  }

  Container body(BuildContext context) {
    final user_satate = context.read<UserCubit>().state;
    return Container(
      color: Color.fromARGB(255, 199, 181, 236),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            mail_head(),
            SizedBox(
              height: 10,
            ),
            mail_body(),
            mail_button(context)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("hello2");
    connect();
  }

//socket io.....................................................................................
  void connect() {
    socket = IO.io(realTime, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    print("inside");
    socket.connect();
    final user_state = context.read<UserCubit>().state;
    String id = (user_state is UserLogedin) ? user_state.uuid : "000";
    socket.emit('signin', id);
    socket.onConnect((data) {
      print("connected");
      socket.on('msg', (msg) {
        print(msg);
        setMessages(
            "target", msg["message"], msg["time"], msg["from"], msg["to"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(microseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, String time, String sender, String target) {
    socket.emit('msg',
        {"message": message, "time": time, "from": sender, "to": target});
    setMessages("sender", message, time, sender, target);
  }

  void setMessages(
      String type, String msg, String time, String from, String to) {
    Message message =
        Message(type: type, message: msg, time: time, from: from, to: to);
    setState(() {
      messages.add(message);
    });
  }

//build...............................................................................................................
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: body(context),
    );
  }
}
