import 'package:doctracker/presentation/constants/constants.dart';
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
          Image.asset("assets/images/logo_dt.PNG"),
          Text(""),
          Text(""),
          TextFieldContainer(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Organization",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldContainer(
            child: TextField(
                decoration: InputDecoration(
              hintText: "Branch",
              border: InputBorder.none,
            )),
          ),
          Text(""),
          FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              )),
          Text(""),
          Text(""),
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
