import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/data/model/messageModel.dart';
import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/doc_request_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/customer/Mail/own_message_card.dart';
import 'package:doctracker/presentation/screens/customer/Mail/reply_card.dart';
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
            child: BlocBuilder<DocRequestCubit, DocRequestState>(
              builder: (context, state) {
                if (state is DocRequest) {
                  _head_controller.text = "Document Request";
                  return TextFormField(
                    //textAlignVertical: TextAlignVertical.center,
                    controller: _head_controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Document request',
                        contentPadding: EdgeInsets.all(7)),
                  );
                } else {
                  return TextFormField(
                    //textAlignVertical: TextAlignVertical.center,
                    controller: _head_controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mail Head',
                        contentPadding: EdgeInsets.all(7)),
                  );
                }
              },
            )));
  }

  Container mail_body() {
    return Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
            margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: BlocBuilder<DocRequestCubit, DocRequestState>(
              builder: (context, state) {
                if (state is DocRequest) {
                  //final doc_name =
                  //   (state is DocRequest) ? state.doc_name : "000";
                  //final from_name = (state is DocRequest) ? state.from : "000";
                  _body_controller.text =
                      "Doc name : ${state.doc_name} is requested.";
                }
                return TextFormField(
                  //textAlignVertical: TextAlignVertical.center,
                  controller: _body_controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                  minLines: 20,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message...',
                      contentPadding: EdgeInsets.all(7)),
                );
              },
            )));
  }

  Future sendMail(BuildContext context) async {
    final user_state = context.read<UserCubit>().state;
    final mail_state = context.read<MailCubit>().state;
    final socket_state = context.read<SocketCubit>().state;
    final data = {
      "from": (user_state is UserLogedin) ? user_state.uuid : "000",
      "to": widget.user.uuid,
      "time": DateTime.now().toString().substring(0, 19),
      "seen": false,
      "head": _head_controller.text,
      "body": _body_controller.text
    };

    //post mail to db
    if (mail_state is MailLoaded) {
      print(data);
      await context.read<MailCubit>().sendMail(data);
      context.read<DocRequestCubit>().toInitialState();
      Navigator.pushNamed(context, 'chat');
    }
    //emit event
    if (socket_state is SocketConnected) {
      socket_state.socket.emit('new_mail', widget.user.uuid);
    }
  }

  MaterialButton mail_button(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        sendMail(context);
        Notify();
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
    super.initState();
  }

//socket io.....................................................................................

//build...............................................................................................................
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: appbar(context),
        body: body(context),
      ),
    );
  }
}

void Notify() async {
  AwesomeNotifications a = new AwesomeNotifications();
  await a.createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Notification',
          body: 'Mail sent'));
}
