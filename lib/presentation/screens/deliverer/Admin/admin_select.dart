import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/material.dart';

class AdminSelect extends StatelessWidget {
  //const AdminSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DocTracker - Select Admin'
            //TextStyle(color: Colors.white),
            ),
        backgroundColor: kPrimaryColor,
      ),
      body: TextFieldContainer(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Admin",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
      ),
      child: child,
    );
  }
}
