import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsScreen extends StatelessWidget {
  //const JobsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socket_state = context.read<SocketCubit>().state;
    if (socket_state is SocketConnected) {
      print("inside");
      socket_state.socket.on('new_job', (data) {
        print('new job come');
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
              color: kPrimaryLightColor,
              onPressed: () async {
                Navigator.pushNamed(context, 'jobinside');
              },
              child: Text(
                "Job 1",
                style: TextStyle(color: Colors.black),
              )),
          SizedBox(height: 20),
          MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
              color: kPrimaryLightColor,
              onPressed: () async {},
              child: Text(
                "Job 2",
                style: TextStyle(color: Colors.black),
              )),
          SizedBox(height: 20),
          MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
              color: kPrimaryLightColor,
              onPressed: () async {},
              child: Text(
                "Job 3",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
