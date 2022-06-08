import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../data/model/userModel.dart';
import '../../data/repository/userRepo.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLogedout(is_logout: true));

  void setUser(String username, String uuid, User user) {
    emit(UserLogedout(is_logout: false));
    emit(UserLogedin(username: username, uuid: uuid, user: user));
  }

  Future getUser(String username, String password, BuildContext context) async {
    UserRepo userRepo = UserRepo();
    try {
      User user = await userRepo.getUser(username, password, context);
      print(user.name);
      if (user.username == username) {
        setUser(user.username, user.uuid, user);
      } else {
        emit(UserLogedout(is_logout: true));
      }
      //emit(UserState(username: user.name, uuid: user.uuid, user: user));
    } catch (e) {
      print('error');
      //emit(UserState(username: "No Body", uuid: uuid, user: user))
      emit(UserLogedout(is_logout: true));
      print(e.toString());
    }
  }

  Future updateProfilePic(String download_url) async {
    print(download_url);
    UserRepo userRepo = UserRepo();
    try {
      final user_state = state;
      User user = await userRepo.updateProfilePic(
          download_url, (user_state is UserLogedin) ? user_state.uuid : "000");
      print(user.name);
      if (user.username != null) {
        //emit(UserLogedin(username: user.username, uuid: user.uuid, user: user));
        setUser(user.username, user.uuid, user);
      } else {
        emit(UserLogedout(is_logout: true));
      }
      //emit(UserState(username: user.name, uuid: user.uuid, user: user));
    } catch (e) {
      print('error');
      //emit(UserState(username: "No Body", uuid: uuid, user: user))
      emit(UserPicUpdateError());
      print(e.toString());
    }
  }

  void logout() {
    emit(UserLogedin(
        username: '',
        uuid: '',
        user: User(
            uuid: '',
            username: '',
            name: '',
            email: '',
            role: '',
            branch: '',
            branchId: '',
            image_url: '')));
    emit(UserLogedout(is_logout: true));
  }
}
