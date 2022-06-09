import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExternalJob extends StatelessWidget {
  const ExternalJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uuid = Card(
      child: Column(
        children: [
          ListTile(
            title: Text('UUID'),
            // subtitle: Text(context.read<QrCubit>().state.uuid),
          ),
        ],
      ),
    );
    final name = Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Name'),
            //subtitle: Text(context.read<QrCubit>().state.name),
          ),
        ],
      ),
    );
    final department = Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Department'),
            //subtitle: Text(context.read<QrCubit>().state.department),
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
    final endBranch = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          maxLength: 100,
          decoration: InputDecoration(
            labelText: 'End Branch',
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 50, 49, 51),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 30, 31)),
            ),
          ),
        ));

    final requestButton = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        child: Text('Request from Admin'),
        color: Colors.amberAccent[400],
        onPressed: () {
          // context.read<QrCubit>().setInternal();
          Navigator.pushNamed(context, 'internaljob');
        });
    return SafeArea(
        child: Scaffold(
      appBar: appBar('Internal Job'),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              uuid,
              name,
              department,
              endCustomer,
              endBranch,
              requestButton,
            ],
          ),
        ),
      ),
    ));
  }
}
