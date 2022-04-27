import 'dart:convert';

import 'package:doctracker/data/provider/mailProvider.dart';
import 'package:doctracker/data/provider/userProvider.dart';

import '../model/mailModel.dart';

class UserRepo {
  MailProvider _mailProvider = MailProvider();

  Future<Mail> sendMail(Map body) async {
    final response = await _mailProvider.sendMail('/mail/add', body);
    print(response.data);
    final data = response.data;
    final jsonData = jsonEncode(data);
    print(jsonData);
    final mail = Mail.fromJson(jsonDecode(jsonData));
    print("hi");
    return mail;
  }
}
