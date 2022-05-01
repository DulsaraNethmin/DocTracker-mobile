import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
                child: GFAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                  radius: 50,
                ),
              ),
            ),
            GFButton(
              onPressed: () {},
              text: "Upload an Image",
              type: GFButtonType.transparent,
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
