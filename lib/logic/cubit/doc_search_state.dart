part of 'doc_search_cubit.dart';

@immutable
abstract class DocSearchState {}

class DocSearchInitial extends DocSearchState {}

class DocSearching extends DocSearchState {}
