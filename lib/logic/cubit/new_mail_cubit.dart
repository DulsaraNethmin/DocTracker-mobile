import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_mail_state.dart';

class NewMailCubit extends Cubit<NewMailState> {
  NewMailCubit() : super(NewMailInitial());

  void newMail() {
    emit(NewMailCome());
  }

  void toInitialState() {
    emit(NewMailInitial());
  }
}
