import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'branch_user_state.dart';

class BranchUserCubit extends Cubit<BranchUserState> {
  BranchUserCubit() : super(BranchUserInitial());
}
