import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/my_delivery_cubit.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/custom_card_my_jobs.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyJobs extends StatefulWidget {
  MyJobs({Key? key}) : super(key: key);

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getMyJobs();
    context.read<MyDeliveryCubit>().getAllMyDelivery(context);
    final my_delivery_state = context.read<MyDeliveryCubit>().state;
    Map<String, List<Delivery>> map =
        (my_delivery_state is MyDeliveryLoaded) ? my_delivery_state.map : {};
    return Scaffold(
        appBar: appBar('My Jobs'),
        bottomNavigationBar: BottomNavBar(),
        body: BlocListener<MyDeliveryCubit, MyDeliveryState>(
          listener: (context, state) {
            if (state is MyDeliveryLoaded) {
              setState(() {
                map = state.map;
              });
            }
          },
          child: ListView.builder(
              itemCount: map.keys.length,
              itemBuilder: (context, index) {
                return MyCustomCard(
                    list: (map.keys.length == 0)
                        ? []
                        : map[map.keys.toList()[index]]);
              }),
        ));
  }
}
