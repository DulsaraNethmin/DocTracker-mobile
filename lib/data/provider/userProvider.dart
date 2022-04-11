import "package:http/http.dart" as http;

class UserProvider {
  String base_url = "http://localhost:8080";

  Future<http.Response> getUser(String end_point, Map body) async {
    var url = Uri.parse(base_url + end_point);
    var res = await http.post(url, body: body);
    return res;
  }
}
