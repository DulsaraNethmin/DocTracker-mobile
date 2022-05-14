import 'package:dio/dio.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';

class QrProvider {
  final dio = Dio();
  Future<Response> verify(String url) async {
    var res = await dio.get(url);
    return res;
  }
}
