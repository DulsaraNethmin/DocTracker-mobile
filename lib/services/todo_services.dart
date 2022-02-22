import 'package:dio/dio.dart';
import 'package:doctracker/models/todo_model.dart';
import 'package:flutter/cupertino.dart';

class ToDoService {
  static String url = 'https://dummyjson.com/todos/random';
  late Dio _dio;
  ToDoService() {
    _dio = Dio();
  }

  Future getTodo() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        print(response.data);
        //response.data['todos'].map{(e){}}
        Todo t1 = Todo.fromJson(response.data);
        print(t1);
        return response.data;
      }
    } on DioError catch (e) {
      return Text('erro happend');
    }
  }
}
