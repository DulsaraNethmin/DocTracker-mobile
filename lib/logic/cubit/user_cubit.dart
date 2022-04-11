import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/userModel.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(UserState(
            username: "",
            uuid: "",
            user: User(
                uuid: "",
                name: "",
                email: "",
                usenmae: "",
                role: "",
                branch: "")));

  void setUser(String username, String uuid, User user) {
    emit(UserState(username: username, uuid: uuid, user: user));
  }

  bool getUser(String username, String password) {
    UserRepo userRepo;
  }
}
