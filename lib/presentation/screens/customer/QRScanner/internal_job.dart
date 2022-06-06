import 'package:doctracker/data/model/new_job_model.dart';
import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/logic/cubit/end_customer_cubit.dart';
import 'package:doctracker/logic/cubit/new_job_cubit.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/main.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalJob extends StatelessWidget {
  const InternalJob({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final qr_state = context.read<QrCubit>().state;
    final end_customer_controller = TextEditingController();
    final user_state = context.read<UserCubit>().state;
    final user_id = (user_state is UserLogedin) ? user_state.uuid : "000";
    final end_customer_select_state = context.read<EndCustomerCubit>().state;
    //final new_job_state = context.read<NewJobCubit>().state;
    var qr_data = new QrScan(
        docId: '000',
        docName: '000',
        type: '000',
        branchId: '000',
        branch: '000',
        currentUserId: '000',
        currentUserName: '000');
    if (qr_state is QrVerified) qr_data = qr_state.scan_data;
    // if (new_job_state is NewJobs) {
    //   final job=NewJob(doc_id: qr_data.docId,doc_name: qr_data.docName,end_customer: qr_data.)
    //   context.read<NewJobCubit>().addToJobArray(newjob)
    // }
    final uuid = Card(
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UUID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(qr_data.docId),
              ],
            ),
            //subtitle: Text(context.read<QrCubit>().state.uuid),
          ),
        ],
      ),
    );
    final name = Card(
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(qr_data.docName),
              ],
            ),
            //subtitle: Text(context.read<QrCubit>().state.name),
          ),
        ],
      ),
    );
    final department = Card(
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(qr_data.type)
              ],
            ),
            // subtitle: Text(context.read<QrCubit>().state.department),
          ),
        ],
      ),
    );

    final endCustomer = Card(
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/select/customer');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'End Customer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
                //Text(qr_data.type),
                BlocBuilder<EndCustomerCubit, EndCustomerState>(
                    builder: (context, state) {
                  if (state is EndCustomerSelected) {
                    return Text(state.name);
                  } else {
                    return (Text("Select the destination"));
                  }
                })
              ],
            ),
            // subtitle: Text(context.read<QrCubit>().state.department),
          ),
        ],
      ),
    );

    final done_button = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        child: Text('Add to List'),
        color: Colors.amberAccent[400],
        onPressed: () {
          //context.read<QrCubit>().setInternal();
          //Navigator.pushNamed(context, '/internaljob');
          context.read<NewJobCubit>().addToJobArray(NewJob(
                doc_id: qr_data.docId,
                doc_name: qr_data.docName,
                end_customer: (end_customer_select_state is EndCustomerSelected)
                    ? end_customer_select_state.uuid
                    : "000",
                from_customer:
                    (user_state is UserLogedin) ? user_state.uuid : "000",
              ));
        });

    // final create_button = MaterialButton(
    //     minWidth: MediaQuery.of(context).size.width * 0.9,
    //     child: Text('Create Job'),
    //     color: Colors.amberAccent[400],
    //     onPressed: () {
    //       //context.read<QrCubit>().setInternal();
    //       Navigator.pushNamed(context, '/qr');
    //     });
    // final create_button_potition = Align(
    //   child: create_button,
    //   alignment: Alignment.bottomLeft,
    // );
    final action_button = FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/qr');
      },
      child: Icon(Icons.add),
    );

    final appbar = AppBar(
      backgroundColor: Color.fromARGB(255, 91, 57, 160),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Internal Job",
            style: TextStyle(fontSize: 20, color: Colors.grey[200]),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Finish",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      elevation: 0,
    );
    return SafeArea(
        child: Scaffold(
      appBar: appbar,
      floatingActionButton: action_button,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            uuid,
            name,
            department,
            endCustomer,
            done_button,
            //create_button_potition,
            //add_more_button,
          ],
        ),
      ),
    ));
  }
}
