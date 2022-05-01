import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/profile.png',
                  width: 100,
                  height: 100,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
