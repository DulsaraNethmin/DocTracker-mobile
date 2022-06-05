import 'package:dio/dio.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';

class QrProvider {
  String base_url = restAPI;
  final dio = Dio();
  Future<Response> verify(String url) async {
    List<String> st_arr = url.split('=');
    String doc_id = st_arr[1];
    //String url2 = url.substring(0, url.indexOf('&'));
    //String uuid = st_arr[2];
    String url2 = url.substring(0, url.indexOf('?'));
    String full_url = base_url + url2;
    print(full_url + "   nethmin");
    print(doc_id + " " + full_url);
    var res = await dio.get(full_url, queryParameters: {"doc_id": doc_id});
    return res;
  }
}
