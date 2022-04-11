import 'dart:convert';

import 'package:doctracker/data/provider/userProvider.dart';

import '../model/userModel.dart';

class UserRepo {
  UserProvider _userProvider = UserProvider();
  Future<User> getUser(String username, String password) async {
    var response = await _userProvider
        .getUser('/user/one', {"username": username, "password": password});
    User user = User.fromJson(jsonDecode(response.body.toString()));
    return user;
  }
}
