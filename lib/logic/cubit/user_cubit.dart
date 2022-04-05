import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(username: "", uuid: ""));

  void setUser(String username, String uuid) {
    emit(UserState(username: username, uuid: uuid));
  }
}
