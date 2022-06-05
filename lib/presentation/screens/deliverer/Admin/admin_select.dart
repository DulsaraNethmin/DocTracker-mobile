import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class AdminSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DocTracker - Select Admin'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 260, 20, 20),
          //height: size.height,
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Admin",
                    border: InputBorder.none,
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/personal');
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
