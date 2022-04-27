import 'dart:convert';
import '../../presentation/constants/constants.dart';
import 'package:dio/dio.dart';

class MailProvider {
  String base_url = restAPI;

  Future<Response> getMail(String end_point, String uuid) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.get(url, queryParameters: {"uuid": uuid});
    return res;
  }

  Future<Response> sendMail(String end_point, Map body) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.post(url, data: body);
    return res;
  }
}
