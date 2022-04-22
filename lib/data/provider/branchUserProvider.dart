import 'dart:convert';
import '../../presentation/constants/constants.dart';
import 'package:dio/dio.dart';

class BranchUserProvider {
  String base_url = restAPI;

  Future<Response> getUser(String end_point, String branch_id) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.get(url, queryParameters: {"branch_id": branch_id});
    return res;
  }
}
