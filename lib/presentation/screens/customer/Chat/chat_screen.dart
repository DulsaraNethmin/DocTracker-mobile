import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/customer/Chat/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket socket;
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

  FloatingActionButton actionBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/chat/search');
      },
      backgroundColor: Color.fromARGB(255, 91, 57, 160),
      child: Icon(
        Icons.mail_sharp,
        color: Colors.white,
      ),
    );
  }

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
      });
    });
    print(socket.connected);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    List<Chat> chats = [
      Chat(
          name: "Sangeeth",
          icon: "assets/images/profile.png",
          time: "17:19",
          currentMessage: "Hello man",
          status: '',
          id: '1'),
      Chat(
          name: "Chamodhya",
          icon: "assets/images/profile.png",
          time: "17:19",
          currentMessage: "Hello man",
          status: '',
          id: '2'),
      Chat(
          name: "Chinthani",
          icon: "assets/images/profile.png",
          time: "14:00",
          currentMessage: "Hello man",
          status: '',
          id: '3'),
      Chat(
          name: "Nethmin",
          icon: "assets/images/profile.png",
          time: "07:20",
          currentMessage: "Hello man",
          status: '',
          id: '4'),
      Chat(
          name: "Harsha",
          icon: "assets/images/profile.png",
          time: "07:20",
          currentMessage: "Hello man",
          status: '',
          id: '5'),
    ];
    return Scaffold(
      appBar: appbar,
      floatingActionButton: actionBtn(context),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return CustomCard(
            chatModel: chats[index],
          );
        },
      ),
    );
  }
}
