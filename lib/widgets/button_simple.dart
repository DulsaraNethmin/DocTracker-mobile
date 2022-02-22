import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  var click;
  String? text;
  Button(Function click, String text) {
    this.click = click;
    this.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MaterialButton(
          onPressed: click,
          child: Text(
            text ?? "click me",
            style: TextStyle(fontSize: 25),
          ),
          color: Color.fromARGB(255, 9, 236, 20),
          height: 50,
        ),
      ),
    );
  }
}
