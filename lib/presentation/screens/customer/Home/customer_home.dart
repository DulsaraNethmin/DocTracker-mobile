import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
import 'package:doctracker/presentation/widgets/analog_clock.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<SocketCubit>().connect(context);
    context.read<BotnavbarCubit>().onSelect(0);
    final user_state = context.read<UserCubit>().state;
    final bio = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (user_state is UserLogedin) ? user_state.user.name : "Empty User",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Service id: xxx-xxx-C',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ],
      ),
    );
    final pic = CircleAvatar(
      radius: 35,
      child: Image.asset('assets/images/profile.png'),
    );
    final topcard = Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Color(0xff8c52ff),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bio,
              pic,
            ],
          ),
        ),
      ),
    );

    void logout() {}

    final topContainer = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Color.fromARGB(255, 240, 231, 239),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.red,
              child: Column(
                children: [
                  Icon(
                    Icons.punch_clock,
                    size: 40,
                    color: Colors.grey[350],
                  ),
                  Text('Pending')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.green,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    icon: Icon(
                      Icons.mail,
                      size: 40,
                      color: Colors.grey[350],
                    ),
                  ),
                  Text('Mails')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                print('logout');
                //context.read<UserCubit>().logout();
                context.read<BranchUserCubit>().toInitialState();
                context.read<DocumentCubit>().toInitialState();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => true);
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context) => LoginScreen()),
                //     (Route<dynamic> route) => false);
                //Navigator.popUntil(context, ModalRoute.withName('/login'));
                //Navigator.pushNamed(context, '/login');
                //Navigator.of(context).popUntil(ModalRoute.withName('/login'));
              },
              child: Card(
                color: Colors.blue,
                child: Column(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 40,
                      color: Colors.grey[350],
                    ),
                    Text('Logout')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final middleBody = Container(
      child: Column(
        children: [
          //row1,
          //row2,
        ],
      ),
    );

    final row1 = Row(
      children: [],
    );

    final button = MaterialButton(
      child: Text('QR'),
      color: Colors.amberAccent[400],
      onPressed: () {
        Navigator.pushNamed(context, '/qr');
      },
    );
    final button2 = MaterialButton(
      child: Text('hello'),
      color: Colors.amberAccent[400],
      onPressed: () {
        print('hello button');
      },
    );

    return Scaffold(
      appBar: appBar('Home'),
      body: SafeArea(
          child: Column(
        children: [
          topcard,
          topContainer,
          //Text('home'),
          //button,
          //button2,
        ],
      )),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
