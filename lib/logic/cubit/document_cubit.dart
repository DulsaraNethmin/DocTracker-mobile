import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../data/model/documentModel.dart';
import '../../data/repository/documentRepo.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentState(docs: []));
  final documentRepo = DocumentRepo();
  Future getAllDocs(BuildContext context) async {
    List<Document> doc_arr = await documentRepo.getAllDocument(context);
    emit(DocumentState(docs: doc_arr));
  }
}
