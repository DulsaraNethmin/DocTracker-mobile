import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.3,
              height: size.height * 0.2,
            ),
            SizedBox(height: 10),
            Text(
              "DocTracker",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 3,
            ),
            SizedBox(height: 10),
            Text(
              "We remember your Docs",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 30),
            MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 58),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, 'org');
                },
                child: Text(
                  "Join an Organization",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
