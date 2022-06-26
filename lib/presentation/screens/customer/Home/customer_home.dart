import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHome extends StatelessWidget {
  //const DelivererHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BotnavbarCubit>().onSelect(0);
    final mail_state = context.read<MailCubit>().state;
    final user_state = context.read<UserCubit>().state;
    final socket_state = context.read<SocketCubit>().state;
    if (mail_state is MailLoading) {
      context
          .read<MailCubit>()
          .getMails(user_state is UserLogedin ? user_state.uuid : "000");
    }

    // if (socket_state is SocketConnected) {
    //   socket_state.socket.on('new_job', (data) {
    //     print('new job come');
    //   });
    // }
    if (!(socket_state is SocketConnected)) {
      context.read<SocketCubit>().connect(context);
    }

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
                "assets/images/customer.jpg",
              ),
              Row(
                children: [
                  Card(
                      margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                      color: kPrimaryLightColor,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.13, 30.0, size.width * 0.13, 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                          ],
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                      color: kPrimaryLightColor,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.15, 30.0, size.width * 0.15, 30.0),
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
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
