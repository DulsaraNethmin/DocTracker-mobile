part of 'document_cubit.dart';

@immutable
abstract class DocumentState {}

class DocumentLoading extends DocumentState {}

class DocumentLoaded extends DocumentState {
  List<Document> docs;

  DocumentLoaded({required this.docs});
}

class DocumentError extends DocumentState {}
