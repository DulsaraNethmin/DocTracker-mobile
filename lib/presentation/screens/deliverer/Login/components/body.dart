import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/screens/deliverer/Organization/org_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            width: size.width * 0.3,
            height: size.height * 0.2,
          ),
          Text(""),
          Text(
            "Sign in as a Customer or as a Deliverer to continue",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(""),
          TextFieldContainer(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldContainer(
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ))),
          ),
          Text(""),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 55),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/customer/home');
              },
              child: Text(
                "Sign In as Customer",
                style: TextStyle(color: Colors.white),
              )),
          Text(""),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrgScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Sign in as Deliverer",
                style: TextStyle(color: Colors.white),
              )),
          Text(""),
          Text(
            "Forgot Password?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
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
