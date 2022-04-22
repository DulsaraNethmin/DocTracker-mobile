import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/search_result_user.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
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
    final state = context.read<BranchUserCubit>().state;
    final branch = context.read<UserCubit>().state.user.branchId;
    if (!(state is BranchUserLoaded))
      context.read<BranchUserCubit>().getUser(branch);

    final search = Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0.8)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor)),
            hintText: "Search Document",
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            suffixIcon:
                IconButton(icon: const Icon(Icons.clear), onPressed: () {})),
      ),
    );
    final result = BlocBuilder<BranchUserCubit, BranchUserState>(
      builder: (context, state) {
        if (state is BranchUserLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator.adaptive()),
            ],
          );
        } else if (state is BranchUserLoaded) {
          return SearchResultUsers(
            arr: state.user,
          );
        }
        return CircularProgressIndicator();
      },
    );
    return Scaffold(
      appBar: appBar('New Chat'),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [search, result],
        ),
      ),
    );
  }
}
