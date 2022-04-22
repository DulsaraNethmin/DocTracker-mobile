import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/userModel.dart';
import '../../data/repository/branchUserRepo.dart';

part 'branch_user_state.dart';

class BranchUserCubit extends Cubit<BranchUserState> {
  BranchUserCubit() : super(BranchUserLoading());

  Future getUser(String branch_id) async {
    BranchUserRepo branchUserRepo = BranchUserRepo();
    bool result = false;
    try {
      List<User> user = await branchUserRepo.getUser(branch_id);
      print(user);
      emit(BranchUserLoaded(user: user));
      result = true;
    } catch (e) {
      result = false;
      print('error');
      //emit(UserState(username: "No Body", uuid: uuid, user: user))
      print(e.toString());
    }
  }
}
