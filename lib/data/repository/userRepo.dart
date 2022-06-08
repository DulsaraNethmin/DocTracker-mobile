import 'dart:convert';

import 'package:doctracker/data/provider/userProvider.dart';
import 'package:doctracker/logic/cubit/jwt_token_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/userModel.dart';

class UserRepo {
  UserProvider _userProvider = UserProvider();
  Future<User> getUser(
      String username, String password, BuildContext context) async {
    final response = await _userProvider
        .getUser('/user/get/one', {"username": username, "password": password});
    print(response.data[0]);
    final data = response.data[0];
    final token = response.data[0]["token"];
    context.read<JwtTokenCubit>().getToken(token);
    print(token);
    final jsonData = jsonEncode(data);
    print(jsonData);
    final user = User.fromJson(jsonDecode(jsonData));
    print("hi");
    return user;
  }

  Future<User> updateProfilePic(
      String download_url, String uuid, String token) async {
    print(download_url + "   " + uuid);
    final response =
        await _userProvider.updateProfilePic(download_url, uuid, token);
    print(response.data[0]);
    final data = response.data[0];
    final jsonData = jsonEncode(data);
    print(jsonData);
    final user = User.fromJson(jsonDecode(jsonData));
    print("hi");
    return user;
  }
}
