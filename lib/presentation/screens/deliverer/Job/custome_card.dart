import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  List<Delivery>? list = [];
  CustomCard({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [(list == null) ? Text('') : Text(list![0].docName)]));
  }
}
