import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/presentation/widgets/analog_clock.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BotnavbarCubit>().onSelect(0);
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
                  Icon(
                    Icons.mail,
                    size: 40,
                    color: Colors.grey[350],
                  ),
                  Text('Mails')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.blue,
              child: Column(
                children: [
                  Icon(
                    Icons.money,
                    size: 40,
                    color: Colors.grey[350],
                  ),
                  Text('Payments')
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final middleBody = Container(
      child: Column(
        children: [],
      ),
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
          topContainer,
          Text('home'),
          button,
          button2,
        ],
      )),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
