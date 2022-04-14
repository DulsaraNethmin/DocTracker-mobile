import 'dart:convert';

import 'package:doctracker/data/provider/documentProvider.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/documentModel.dart';

class DocumentRepo {
  final _documentProvider = DocumentProvider();
  Future<List<Document>> getAllDocument(BuildContext context) async {
    final branch_id = context.read<UserCubit>().state.user.branchId;
    final branch = context.read<UserCubit>().state.user.branch;
    //final end_point = '/document/get/all?branch_id=${branch_id}';
    final end_point = '/document/get/by/branch';
    final res = await _documentProvider.getAllDoc(end_point, branch_id);
    print(res);
    //print(res.data.length);
    List<Document> arr = [];
    for (int i = 0; i < res.data.length; i++) {
      final jsonData = jsonEncode(res.data[i]);
      final jsondata2 = jsonDecode(jsonData);
      final doc_data = Document.fromJson(jsondata2);
      arr.add(doc_data);
    }
    // final jsonData = jsonEncode(res);
    // final jsondata2 = jsonDecode(jsonData);
    // arr = Document.fromJson(jsondata2);
    //print(arr[0].customerName);
    return arr;
  }
}
