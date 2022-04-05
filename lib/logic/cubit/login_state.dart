part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  final String username;
  final String password;
  LoginInitial({required this.username, required this.password});
}

class Verifiging extends LoginState {}

class Verified extends LoginState {}
