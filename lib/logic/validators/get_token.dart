import 'package:doctracker/logic/cubit/jwt_token_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String getToken(BuildContext context) {
  final token_state = context.read<JwtTokenCubit>().state;
  final token = (token_state is JwtTokenFetched) ? token_state.token : "000";
  return token;
}
