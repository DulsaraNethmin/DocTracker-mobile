import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doc_search_state.dart';

class DocSearchCubit extends Cubit<DocSearchState> {
  DocSearchCubit() : super(DocSearchInitial());

  void toInitialState() {
    emit(DocSearchInitial());
  }

  void docSearching() {
    emit(DocSearching());
  }
}
