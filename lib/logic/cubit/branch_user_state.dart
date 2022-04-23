part of 'branch_user_cubit.dart';

@immutable
abstract class BranchUserState {}

class BranchUserLoading extends BranchUserState {}

class BranchUserLoaded extends BranchUserState {
  List<User> user = [];
  BranchUserLoaded({required this.user});
}

class BranchUserError extends BranchUserState {}
