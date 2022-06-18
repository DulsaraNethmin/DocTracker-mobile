import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/new_mail_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/customer/Mail/custom_card.dart';
import 'package:doctracker/presentation/screens/customer/Mail/user_search.dart';
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
  //late IO.Socket socket;

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
        Navigator.pushNamed(context, 'chatsearch');
      },
      backgroundColor: Color.fromARGB(255, 91, 57, 160),
      child: Icon(
        Icons.mail_sharp,
        color: Colors.white,
      ),
    );
  }

//......................................................................................................................

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<SocketCubit>().connect(context);
    //connect();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //socket.disconnect();
    super.dispose();
  }

//......................................................................................................................
  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    final user_id = (user_state is UserLogedin) ? user_state.uuid : "000";
    final socket_state = context.read<SocketCubit>().state;
    print('re-build');

    context.read<BotnavbarCubit>().onSelect(4);
    final mail_state = context.read<MailCubit>().state;
    List<Mail> sentMail =
        (mail_state is MailLoaded) ? mail_state.sentMails : [];
    List<Mail> receivedMail =
        (mail_state is MailLoaded) ? mail_state.receivedMails : [];

    //......................................................................................................................
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar,
        bottomNavigationBar: MyBottomNavBar(),
        body: BlocListener<MailCubit, MailState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is MailLoaded) {
              setState(() {
                sentMail =
                    (mail_state is MailLoaded) ? mail_state.sentMails : [];
              });

              setState(() {
                receivedMail =
                    (mail_state is MailLoaded) ? mail_state.receivedMails : [];
              });
              context.read<NewMailCubit>().newMail();
            }
          },
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: sentMail.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    mail: sentMail[index],
                  );
                },
              ),
              ListView.builder(
                itemCount: receivedMail.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    mail: receivedMail[index],
                  );
                },
              ),
              Center(child: UserSearch()),
            ],
          ),
        ),
      ),
    );
  }
}
