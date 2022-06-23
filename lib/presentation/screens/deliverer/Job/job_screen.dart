import 'package:doctracker/logic/cubit/delivery_cubit.dart';
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
    final delivery_state = context.read<DeliveryCubit>().state;
    if (socket_state is SocketConnected) {
      print("inside");
      socket_state.socket.on('new_job', (data) {
        print('new job come');
        context.read<DeliveryCubit>().getAllDelivery(context);
        if
      });
    }

    final jobs=
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        backgroundColor: kPrimaryColor,
      ),
      body: 
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
