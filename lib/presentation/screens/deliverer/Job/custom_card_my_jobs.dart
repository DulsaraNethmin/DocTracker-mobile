import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/logic/cubit/my_delivery_cubit.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/job_inside_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class MyCustomCard extends StatefulWidget {
  List<Delivery>? list = [];
  MyCustomCard({required this.list});

  @override
  State<MyCustomCard> createState() => _MyCustomCardState();
}

class _MyCustomCardState extends State<MyCustomCard> {
  @override
  Widget build(BuildContext context) {
    final tile = print("inside the my card");
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
                  icon: GFBadge(
                    color: GFColors.WARNING,
                    //text: 'Pending',
                    shape: GFBadgeShape.circle,
                  ),
                )));
  }
}
