import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  //const JobsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        backgroundColor: kPrimaryColor,
      ),
      //body: Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
