import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../data/model/userModel.dart';
import '../../data/repository/userRepo.dart';
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
                username: "",
                role: "",
                branch: "")));

  void setUser(String username, String uuid, User user) {
    emit(UserState(username: username, uuid: uuid, user: user));
  }

  Future getUser(String username, String password) async {
    UserRepo userRepo = UserRepo();
    bool result = false;
    try {
      User user = await userRepo.getUser(username, password);
      print(user.name);
      emit(UserState(username: user.name, uuid: user.uuid, user: user));
      result = true;
    } catch (e) {
      result = false;
      print('error');
      //emit(UserState(username: "No Body", uuid: uuid, user: user))
      print(e.toString());
    }
  }
}
