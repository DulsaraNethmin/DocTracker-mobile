import 'dart:convert';
import 'package:doctracker/logic/cubit/user_cubit.dart';

import '../../presentation/constants/constants.dart';
import 'package:dio/dio.dart';

class UserProvider {
  String base_url = restAPI;

  Future<Response> getUser(String end_point, Map body) async {
    var dio = Dio();
    final url = base_url + end_point;
    print(url);
    var res = await dio.post(url, data: body);
    return res;
  }

  Future<Response> updateProfilePic(String download_url, String uuid) async {
    var dio = Dio();
    final url = restAPI + '/user/update/pic';
    var res = await dio
        .put(url, data: {"url": download_url}, queryParameters: {"uuid": uuid});
    return res;
  }
}
