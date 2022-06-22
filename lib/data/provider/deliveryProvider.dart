import 'package:dio/dio.dart';
import 'package:doctracker/presentation/constants/constants.dart';

class Deliveryprovider {
  String base_url = restAPI;

  Future<Response> getAllDelivery(String branch_id) async {
    var dio = Dio();
    var url = base_url + '/job/get/all';
    print(url + "?" + branch_id);
    var result = await dio.get(url, queryParameters: {"branch_id": branch_id});
    return result;
  }

  Future<Response> verifyDelivery(String doc_id) async {
    var dio = Dio();
    var url = base_url + '/job/verify';
    print(url + "?" + doc_id);
    var result = await dio.get(url, queryParameters: {"doc_id": doc_id});
    return result;
  }
}
