import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearch extends StatefulWidget {
  UserSearch({Key? key}) : super(key: key);

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    context
        .read<BranchUserCubit>()
        .getUser('1356d36d-05ca-4a50-98bf-5a941355f418');
    return Container();
  }
}
