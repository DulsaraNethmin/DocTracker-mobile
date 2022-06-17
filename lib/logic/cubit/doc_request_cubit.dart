import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doc_request_state.dart';

class DocRequestCubit extends Cubit<DocRequestState> {
  DocRequestCubit() : super(DocRequestInitial());

  void newRequest(String from, String doc_name) {
    emit(DocRequest(doc_name: doc_name, from: from));
  }

  void toInitialState() {
    print('doc initial state');
    emit(DocRequestInitial());
  }
}
