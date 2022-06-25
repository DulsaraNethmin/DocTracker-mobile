import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doctracker/logic/validators/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../data/model/documentModel.dart';
import '../../data/repository/documentRepo.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentLoading());
  final documentRepo = DocumentRepo();
  Future getAllDocs(BuildContext context) async {
    emit(DocumentLoading());
    try {
      List<Document> doc_arr = await documentRepo.getAllDocument(context);
      emit(DocumentLoaded(docs: doc_arr));
    } catch (e) {
      print(e);
      LogOut(context);
      ScaffoldMessenger.of(context).showSnackBar(error_snack_bar);
    }
  }

  void toInitialState() {
    emit(DocumentLoading());
  }
}
