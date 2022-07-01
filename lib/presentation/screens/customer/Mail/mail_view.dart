import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/getwidget.dart';

class MailView extends StatelessWidget {
  Mail mail = Mail(
      mailId: 'mailId',
      fromId: 'fromId',
      fromName: 'fromName',
      toId: 'toId',
      toName: 'toName',
      head: 'head',
      body: 'body',
      seen: 0,
      time: DateTime.now());

  MailView({required this.mail});

  @override
  Widget build(BuildContext context) {
    final header = GFListTile(
      color: GFColors.LIGHT,
      titleText: mail.head,
    );

    final body = GFCard(
      height: 50,
      color: GFColors.LIGHT,
      boxFit: BoxFit.cover,
      content: Text(mail.body),
    );

    return Scaffold(
      appBar: appBar('From ${mail.fromName}'),
      body: SafeArea(
          child: Column(
        children: [header, body],
      )),
    );
  }
}
