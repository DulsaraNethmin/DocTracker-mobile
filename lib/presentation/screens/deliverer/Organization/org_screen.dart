import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class OrgScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DocTracker - Organization'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(20, 220, 20, 20),
        //height: size.height,
        //width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/admin');
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                )),
            Text(""),
            Text(""),
          ],
        ),
      )),
    );
  }
}
