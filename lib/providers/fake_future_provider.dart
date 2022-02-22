import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person_model.dart';

class WebClient {
  String name = "http web client";
  final List<Map> _persons = [
    {'name': 'abby', 'age': 22, 'gender': 'male'},
    {'name': 'bonny', 'age': 21, 'gender': 'male'},
    {'name': 'sely', 'age': 22, 'gender': 'female'},
    {'name': 'bily', 'age': 22, 'gender': 'male'}
  ];
  Future<List> get(String url) async {
    Future.delayed(Duration(seconds: 3));
    return _persons;
  }
}

final httpProvider = Provider((ref) => WebClient());
final clientProvider = FutureProvider((ref) async {
  final clientX = ref.read(httpProvider);
  var p = clientX.get('no.url.com').then((value) {
    return value.map((e) => Person(e.name, e.age, e.gender)).toList();
  });
  print(p);
  return p;
});
