import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelivererHome extends StatelessWidget {
  //const DelivererHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    context.read<SocketCubit>().connect(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliverer Home'),
        backgroundColor: kPrimaryColor,
      ),
      body:
          // SafeArea(
          //   child:
          Column(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 90.0),
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              (user_state is UserLogedin)
                                  ? user_state.user.name
                                  : "000",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            'Id: xxxxxxxxx',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/profile.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/more/del');
            },
            //child: Text('More screen'),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
