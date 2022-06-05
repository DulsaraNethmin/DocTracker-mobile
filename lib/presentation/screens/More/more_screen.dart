import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DelMoreScreen extends StatelessWidget {
  //const MoreScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: kPrimaryColor,
      ),
      //body: Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
