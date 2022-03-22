import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class QRNext extends StatelessWidget {
  const QRNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internalButton = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.7,
        child: Text('Internal'),
        color: Colors.amberAccent[400],
        onPressed: () {
          Navigator.pushNamed(context, '/qr');
        });
    final externalButton = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.7,
        child: Text('External'),
        color: Colors.amberAccent[400],
        onPressed: () {
          Navigator.pushNamed(context, '/qr');
        });
    return SafeArea(
        child: Scaffold(
      appBar: appBar('Next'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [internalButton, externalButton],
        ),
      ),
    ));
  }
}
