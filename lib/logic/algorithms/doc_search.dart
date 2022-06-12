import 'package:doctracker/data/model/documentModel.dart';
import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

List<Document> searchByName(String name, BuildContext context) {
  final doc_state = context.read<DocumentCubit>().state;
  List<Document> result = [];
  if (doc_state is DocumentLoaded) {
    List<Document> list = doc_state.docs;
    for (int i = 0; i < list.length; i++) {
      if (list[i].doc.toLowerCase().contains(name.toLowerCase())) {
        print(list[i].doc);
        result.add(list[i]);
      }
    }
    return result;
  }
  return result;
}
