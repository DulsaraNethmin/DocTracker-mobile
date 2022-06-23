import 'dart:collection';

import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/logic/cubit/delivery_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/custome_card.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsScreen extends StatefulWidget {
  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
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
      });
    }
    Map<String, List<Delivery>> map =
        (delivery_state is DeliveryLoaded) ? delivery_state.map : HashMap();
    //map = {};
    if (delivery_state is DeliveryLoaded) print('loaded state');
    print(map);
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocListener<DeliveryCubit, DeliveryState>(
        listener: (context, state) {
          if (state is DeliveryLoaded) {
            setState(() {
              map = state.map;
            });
          }
        },
        child: ListView.builder(
            itemCount: map.keys.length,
            itemBuilder: (context, index) {
              return CustomCard(
                  list: (map.keys.length == 0)
                      ? []
                      : map[map.keys.toList()[index]]);
            }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
