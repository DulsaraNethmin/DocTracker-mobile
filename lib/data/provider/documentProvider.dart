import 'package:dio/dio.dart';

class DocumentProvider {
  final base_url = 'http://10.0.2.2:8080';

  Future<Response> getAllDoc(String end_point) async {
    final dio = Dio();
    final url = base_url + end_point;
    final result = await dio.get(url);
    return result;
  }
}
