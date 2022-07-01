import 'package:doctracker/logic/cubit/delivery_cubit.dart';
import 'package:doctracker/logic/cubit/my_delivery_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';

class DelivererHome extends StatelessWidget {
  //const DelivererHome({ Key? key }) : super(key: key);
  // final user_state = context.read<UserCubit>().state;
  // final socket_state = context.read<SocketCubit>().state;
  // if (!(socket_state is SocketConnected)) {
  //   context.read<SocketCubit>().connect(context);
  // }
  // context.read<DeliveryCubit>().getAllDelivery(context);
  // context.read<MyDeliveryCubit>().getAllMyDelivery(context);

  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    final socket_state = context.read<SocketCubit>().state;
    if (!(socket_state is SocketConnected)) {
      context.read<SocketCubit>().connect(context);
    }
    context.read<DeliveryCubit>().getAllDelivery(context);
    context.read<MyDeliveryCubit>().getAllMyDelivery(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Deliverer Home'),
      //   backgroundColor: kPrimaryColor,
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            children: <Widget>[
              Card(
                  margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hi!",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(
                                (user_state is UserLogedin)
                                    ? user_state.user.name
                                    : "000",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Image.asset(
                "assets/images/deliverer.jpg",
              ),
              Wrap(
                children: [
                  Card(
                      margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                      color: kPrimaryLightColor,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'myjobs');
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("My Jobs",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Icon(
                                      Icons.description_sharp,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                      color: kPrimaryLightColor,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("About",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Icon(
                                    Icons.dvr,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
