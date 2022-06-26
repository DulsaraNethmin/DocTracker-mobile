import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/material.dart';

dynamic appBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    title: Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.grey[200]),
    ),
    elevation: 0,
  );
}
