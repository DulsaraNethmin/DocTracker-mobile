import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

User searchAUser(String uuid, BuildContext context) {
  User empty_user = User(
      uuid: '0000',
      name: '000',
      email: '000',
      username: '000',
      role: '000',
      branch: '000',
      branchId: '000',
      image_url: '000');
  final barnch_user_state = context.read<BranchUserCubit>().state;
  List<User> users =
      (barnch_user_state is BranchUserLoaded) ? barnch_user_state.user : [];
  for (int i = 0; i < users.length; i++) {
    if (users[i].uuid == uuid) {
      return users[i];
    }
  }
  return empty_user;
}
