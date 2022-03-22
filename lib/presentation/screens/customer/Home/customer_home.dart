import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Home'),
      body: SafeArea(
          child: Center(
        child: Text('home'),
      )),
    );
  }
}
