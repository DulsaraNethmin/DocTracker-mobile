import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.mail});
  final Mail mail;
  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    return InkWell(
      onTap: () {
        print(
            "sender: ${(user_state is UserLogedin) ? user_state.uuid : "000"} and targe : ${mail.toId}");
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.mark_email_unread),
              radius: 30,
            ),
            title: Text(
              "${mail.head} - ${mail.fromName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Text("To - ${mail.toName}"),
              ],
            ),
            trailing: Column(
              children: [
                Text(mail.time.toString().substring(5, 9)),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.delete_sharp,
                  color: Colors.black,
                ),
              ],
            ),
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
