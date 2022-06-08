part of 'jwt_token_cubit.dart';

@immutable
abstract class JwtTokenState {}

class JwtTokenInitial extends JwtTokenState {}

class JwtTokenFetched extends JwtTokenState {
  String token;
  JwtTokenFetched({required this.token});
}

class JwtTokenError extends JwtTokenState {}
