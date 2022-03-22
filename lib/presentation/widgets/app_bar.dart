import 'package:flutter/material.dart';

dynamic appBar(String title) {
  return AppBar(
    backgroundColor: Colors.purple[600],
    title: Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.grey[200]),
    ),
    elevation: 0,
  );
}
