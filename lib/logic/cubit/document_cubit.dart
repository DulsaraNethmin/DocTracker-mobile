import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../data/model/documentModel.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentState(docs: []));
  final documentRepo= DocumentRepo();
  Future getAllDocs(BuildContext context) async{
    final<Document> doc_arr=documentRepo.getAllDocuments(context);
    emit(DocumentState(docs: docs))
  }
}
