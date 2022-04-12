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
    final end_point = '/document/get/all?branch_id=${branch_id}';
    final res = await _documentProvider.getAllDoc(end_point);
    print(res);
    List<Document> arr = [];
    for (int i = 0; i < res.data.length; i++) {}
    final jsonData = jsonEncode(res);
    final jsondata2 = jsonDecode(jsonData);
    arr = Document.fromJson(jsondata2);
    return arr;
  }
}
