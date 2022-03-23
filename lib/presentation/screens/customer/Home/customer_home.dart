import 'package:doctracker/presentation/widgets/analog_clock.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContainer = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
          )
        ],
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
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            topContainer,
            Text('home'),
            button,
            button2,
          ],
        ),
      )),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
