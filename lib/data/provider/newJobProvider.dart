import 'package:dio/dio.dart';
import 'package:doctracker/data/model/new_job_model.dart';
import 'package:doctracker/presentation/constants/constants.dart';

class NewJobProvider {
  final base_url = restAPI;
  final dio = Dio();

  Future<Response> createJob(Map body) async {
    final url = base_url + '/job/create/new';
    var response = await dio.post(url, data: body);
    print(response.data);
    return response;
  }

  // Future<Response> addNewDeliveries(List<NewJob> body) async {
  //   List<dynamic> jobs = [];
  //   for(int i=0;i<body.length;i++){
  //     body[i].
  //   }
  // }
}
