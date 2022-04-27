import 'dart:convert';
import 'package:doctracker/data/provider/mailProvider.dart';
import 'package:doctracker/data/provider/userProvider.dart';
import '../model/mailModel.dart';

class MailRepo {
  MailProvider _mailProvider = MailProvider();

  Future<List<Mail>> getSentMail(String user_id) async {
    final response = await _mailProvider.getSentMail('/mail/get/sent', user_id);
    print(response.data);
    final data = response.data;
    List<Mail> arr = [];
    for (int i = 0; i < data.length; i++) {
      final jsonData = jsonEncode(data[i]);
      final mail = Mail.fromJson(jsonDecode(jsonData));
      arr.add(mail);
    }
    return arr;
  }

  Future<List<Mail>> getReceivedMail(String user_id) async {
    final response =
        await _mailProvider.getReceivedMail('/mail/get/received', user_id);
    print(response.data);
    final data = response.data;
    List<Mail> arr = [];
    for (int i = 0; i < data.length; i++) {
      final jsonData = jsonEncode(data[i]);
      final mail = Mail.fromJson(jsonDecode(jsonData));
      arr.add(mail);
    }
    return arr;
  }

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
