import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  String? title;
  MyAppBar(String title) {
    this.title = title;
  }
  @override
  Widget build(BuildContext context) {
    print('this is app bar');
    return AppBar(
      title: Center(
          child: Text(
        title ?? "App bar",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )),
      backgroundColor: Colors.black54,
    );
  }
}

// final appBar = (String title) {
//   return (AppBar(
//     title: Center(
//         child: Text(
//       title ?? "App bar",
//       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//     )),
//     backgroundColor: Colors.black54,
//   ));
// };
