part of 'doc_request_cubit.dart';

@immutable
abstract class DocRequestState {}

class DocRequestInitial extends DocRequestState {}

class DocRequest extends DocRequestState {
  String from;
  String doc_name;

  DocRequest({required this.doc_name, required this.from});
}

class DocRequesError extends DocRequestState {}
