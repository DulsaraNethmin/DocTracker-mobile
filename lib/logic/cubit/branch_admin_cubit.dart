import 'package:bloc/bloc.dart';
import 'package:doctracker/data/provider/userProvider.dart';
import 'package:meta/meta.dart';

part 'branch_admin_state.dart';

class BranchAdminCubit extends Cubit<BranchAdminState> {
  BranchAdminCubit() : super(BranchAdminState(branch_admin: ""));

  void getAdminId(String admin_id) async {
    UserProvider userProvider = new UserProvider();
    //var res = await userProvider.getAdminId('/user/get/admin/id', branch);
    //print(res.data);
    emit(BranchAdminState(branch_admin: admin_id));
  }
}
