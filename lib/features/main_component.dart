import 'package:flutter/material.dart';

class MainComponent extends StatefulWidget {
  MainComponent({Key? key}) : super(key: key);

  @override
  State<MainComponent> createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('doctracker'),
      ),
    );
  }
}
