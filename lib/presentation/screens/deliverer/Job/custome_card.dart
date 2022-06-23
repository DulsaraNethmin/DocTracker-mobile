import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomCard extends StatelessWidget {
  List<Delivery>? list = [];
  CustomCard({required this.list});

  @override
  Widget build(BuildContext context) {
    final tile = print("inside the card");
    return (list == null)
        ? Text('')
        : Container(
            child: GFListTile(
                avatar: GFAvatar(
                  child: Image.asset('assets/images/new_job_icon.png'),
                ),
                titleText: "Job BY: " + list![0].customerName,
                subTitleText: "Total Deliveries: " + list!.length.toString(),
                icon: Icon(Icons.arrow_right)));
  }
}
