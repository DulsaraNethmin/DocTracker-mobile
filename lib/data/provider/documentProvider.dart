import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../presentation/constants/constants.dart';

class DocumentProvider {
  String base_url = restAPI;

  Future<Response> getAllDoc(
      String end_point, String branch_id, String token) async {
    var dio = Dio();
    var url = base_url + end_point;
    var result = await dio.get(url,
        queryParameters: {"branch_id": branch_id},
        options: Options(headers: {"x-access-token": token}));
    return result;
  }
}
