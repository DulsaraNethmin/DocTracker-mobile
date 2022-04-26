import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:doctracker/presentation/screens/customer/Chat/search_result_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardSearch extends StatelessWidget {
  const CustomCardSearch({required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    //tring id = (user_state is UserLogedin) ? user_state.uuid : "000";
    return InkWell(
      onTap: () {
        print(
            "New chat with: ${user.uuid} by : ${user_state is UserLogedin ? user_state.uuid : "000"}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualScreen(user: user)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('assets/images/profile.png'),
              radius: 30,
            ),
            title: Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.role,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            //trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
