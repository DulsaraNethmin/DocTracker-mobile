import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'botnavbar_state.dart';

class BotnavbarCubit extends Cubit<BotnavbarState> {
  BotnavbarCubit() : super(BotnavbarState(index: 0));
  void onSelect(int index) {
    emit(BotnavbarState(index: index));
  }

  void toInitialState() {
    emit(BotnavbarState(index: 0));
  }
}
