part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserLogedout extends UserState {
  var is_logout = true;
  UserLogedout({required this.is_logout});
}

class UserLogedin extends UserState {
  String username;
  String uuid;
  User user;
  UserLogedin({required this.username, required this.uuid, required this.user});
}

class UserPicUpdateError extends UserState {}

class UserError extends UserState {}
