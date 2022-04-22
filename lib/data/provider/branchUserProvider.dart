import 'dart:convert';
import '../../presentation/constants/constants.dart';
import 'package:dio/dio.dart';

class BranchUserProvider {
  String base_url = restAPI;

  Future<Response> getUser(String end_point, Map body) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.post(url, data: body);
    return res;
  }
}
