import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jwt_token_state.dart';

class JwtTokenCubit extends Cubit<JwtTokenState> {
  JwtTokenCubit() : super(JwtTokenInitial());

  void getToken(String token) {
    emit(JwtTokenFetched(token: token));
  }

  void toInitialState() {
    emit(JwtTokenInitial());
  }
}
