import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavbar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(index: 0));
  void onSelect(int index) {
    emit(BottomNavBarState(index: index));
  }
}
