import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/constants.dart';
import 'package:test_app1/Screens/Login/login_screen.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/logo_dt.PNG"),
          Text(""),
          Text(
            "DocTracker",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 3,
          ),
          Text(""),
          Text(
            "We remember your Docs",
              style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(""),
          Text(""),
          Text(""),
          Text(""),

          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 100),
            color: kPrimaryColor,
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();
                    },
                ),
              );
              },
              child: Text("Sign In",
          style: TextStyle(color: Colors.white),
              )
          ),
          Text(""),
          Text(""),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text("Join an Organization",
                style: TextStyle(color: Colors.white),
              )
          )
        ],
      ),
    );
  }
}
