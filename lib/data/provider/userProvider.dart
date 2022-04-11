import 'dart:convert';

import 'package:dio/dio.dart';

class UserProvider {
  String base_url = "http://10.0.2.2:8080";

  Future<Response> getUser(String end_point, Map body) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.post(url, data: body);
    return res;
  }
}
