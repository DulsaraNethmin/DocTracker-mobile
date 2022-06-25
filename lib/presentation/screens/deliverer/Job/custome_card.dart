import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/job_inside_screen.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomCard extends StatefulWidget {
  List<Delivery>? list = [];
  CustomCard({required this.list});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final tile = print("inside the card");
    return (widget.list == null)
        ? Text('')
        : Container(
            child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobInside(list: widget.list)),
              );
            },
            child: GFListTile(
                avatar: GFAvatar(
                  child: Image.asset('assets/images/new_job_icon.png'),
                ),
                titleText: "Job BY: " + widget.list![0].customerName,
                subTitleText:
                    "Total Deliveries: " + widget.list!.length.toString(),
                icon: Icon(Icons.arrow_right)),
          ));
  }
}
