import 'dart:convert';

import 'package:doctracker/data/provider/userProvider.dart';

import '../model/userModel.dart';

class UserRepo {
  UserProvider _userProvider = UserProvider();
  Future<User> getUser(String username, String password) async {
    final response = await _userProvider
        .getUser('/user/get/one', {"username": username, "password": password});
    print(response.data[0]);
    final data = response.data[0];
    final jsonData = jsonEncode(data);
    print(jsonData);
    final user = User.fromJson(jsonDecode(jsonData));
    print("hi");
    return user;
  }

  Future<User> updateProfilePic(String download_url, String uuid) async {
    print(download_url + "   " + uuid);
    final response = await _userProvider.updateProfilePic(download_url, uuid);
    print(response.data[0]);
    final data = response.data[0];
    final jsonData = jsonEncode(data);
    print(jsonData);
    final user = User.fromJson(jsonDecode(jsonData));
    print("hi");
    return user;
  }
}
