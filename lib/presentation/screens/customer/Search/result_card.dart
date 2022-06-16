import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/algorithms/search_branch_user.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/doc_request_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/documentModel.dart';

class ResultCard extends StatelessWidget {
  ResultCard({Key? key, required this.doc}) : super(key: key);
  Document doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: InkWell(
        child: Card(
          color: Color.fromARGB(255, 196, 187, 197),
          child: Container(
            width: MediaQuery.of(context).size.width - 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.doc,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Branch: ${doc.branch}",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Current Owner: ${doc.customerName}",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
        onTap: () async {
          final user_state = context.read<UserCubit>().state;
          final from_name =
              (user_state is UserLogedin) ? user_state.user.name : "nobody";
          context.read<DocRequestCubit>().newRequest(from_name, doc.doc);

          final branch_user_state = context.read<BranchUserCubit>().state;
          final branch =
              (user_state is UserLogedin) ? user_state.user.branchId : "000";
          if (!(branch_user_state is BranchUserLoaded))
            await context.read<BranchUserCubit>().getUser(branch);
          User doc_owner = searchAUser(doc.customerId, context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndividualScreen(user: doc_owner)));
        },
      ),
    );
  }
}
