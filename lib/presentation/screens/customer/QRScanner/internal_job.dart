import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalJob extends StatelessWidget {
  const InternalJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qr_state = context.read<QrCubit>().state;
    var qr_data = new QrScan(
        docId: '000',
        docName: '000',
        type: '000',
        branchId: '000',
        branch: '000',
        currentUserId: '000',
        currentUserName: '000');
    if (qr_state is QrVerified) qr_data = qr_state.scan_data;
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

    final endCustomer = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          maxLength: 100,
          decoration: InputDecoration(
            labelText: 'End Customer',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 50, 49, 51),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 30, 31)),
            ),
          ),
        ));

    final done_button = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        child: Text('Done'),
        color: Colors.amberAccent[400],
        onPressed: () {
          //context.read<QrCubit>().setInternal();
          Navigator.pushNamed(context, '/internaljob');
        });

    final add_more_button = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        child: Text('Add another Job'),
        color: Colors.amberAccent[400],
        onPressed: () {
          //context.read<QrCubit>().setInternal();
          Navigator.pushNamed(context, '/internaljob');
        });
    return SafeArea(
        child: Scaffold(
      appBar: appBar('Internal Job'),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            uuid,
            name,
            department,
            endCustomer,
            done_button,
            add_more_button,
          ],
        ),
      ),
    ));
  }
}
