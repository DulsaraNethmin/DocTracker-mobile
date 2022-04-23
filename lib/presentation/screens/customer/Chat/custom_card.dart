import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.chatModel});
  final Chat chatModel;
  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    return InkWell(
      onTap: () {
        print(
            "sender: ${(user_state is UserLogedin) ? user_state.uuid : "000"} and targe : ${chatModel.id}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualScreen(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(chatModel.icon),
              radius: 30,
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 10,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
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
