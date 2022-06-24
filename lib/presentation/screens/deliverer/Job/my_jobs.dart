import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MyJobs extends StatefulWidget {
  MyJobs({Key? key}) : super(key: key);

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('My Jobs'),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
