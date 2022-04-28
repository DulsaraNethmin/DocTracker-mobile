import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/customer/Chat/custom_card.dart';
import 'package:doctracker/presentation/screens/customer/Chat/user_search.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
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

  //......................................................................................................................
  final appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 91, 57, 160),
    title: Text("Mails"),
    elevation: 0,
    actions: [
      IconButton(icon: Icon(Icons.mail), onPressed: () {}),
    ],
    bottom: TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(text: 'Sent', icon: Icon(Icons.send)),
        Tab(text: 'Received', icon: Icon(Icons.call_received)),
        Tab(text: 'New', icon: Icon(Icons.new_label)),
      ],
    ),
  );

//......................................................................................................................
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

//......................................................................................................................
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

//......................................................................................................................
  @override
  Widget build(BuildContext context) {
    context.read<BotnavbarCubit>().onSelect(4);
    final mail_state = context.read<MailCubit>().state;
    List<Mail> sentMail =
        (mail_state is MailLoaded) ? mail_state.sentMails : [];

    //......................................................................................................................
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar,
        //floatingActionButton: actionBtn(context),
        // body: ListView.builder(
        //   itemCount: sentMail.length,
        //   itemBuilder: (context, index) {
        //     return CustomCard(
        //       mail: sentMail[index],
        //     );
        //   },
        // ),
        bottomNavigationBar: MyBottomNavBar(),
        body: TabBarView(
          children: [
            BlocBuilder<MailCubit, MailState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: sentMail.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      mail: sentMail[index],
                    );
                  },
                );
              },
            ),
            Center(child: Text('CATS')),
            Center(child: UserSearch()),
          ],
        ),
      ),
    );
  }
}
