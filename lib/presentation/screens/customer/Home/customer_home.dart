import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text('home'),
            button,
            button2,
          ],
        ),
      )),
    );
  }
}
