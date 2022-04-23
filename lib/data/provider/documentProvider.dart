import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../presentation/constants/constants.dart';

class DocumentProvider {
  String base_url = restAPI;
  //String base_url = "http://10.0.2.2:8080";
  //String base_url = "http://localhost:8080";

  Future<Response> getAllDoc(String end_point, String branch_id) async {
    var dio = Dio();
    var url = base_url + end_point;
    print(url + "?" + branch_id);
    var result = await dio.get(url, queryParameters: {"branch_id": branch_id});
    return result;
  }
}

//nethmin
//12345678