import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/logic/cubit/my_delivery_cubit.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/job_inside_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/my_deliveries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class MyDeliveryCard extends StatefulWidget {
  // List<Delivery>? list = [];
  // MyDeliveryCard({required this.list});
  Delivery delivery = Delivery(
      jobId: "jobId",
      customerId: "customerId",
      customerName: "customerName",
      isJobCompleted: 1,
      deliveryId: "deliveryId",
      docId: "docId",
      docName: "docName",
      endCustmerId: "endCustmerId",
      endCustomerName: "endCustomerName",
      isDeliveryCompleted: 1);
  MyDeliveryCard({required this.delivery});

  @override
  State<MyDeliveryCard> createState() => _MyDeliveryCardState();
}

class _MyDeliveryCardState extends State<MyDeliveryCard> {
  @override
  Widget build(BuildContext context) {
    final tile = print("inside the my delivery card");
    return (widget.delivery == null)
        ? Text('')
        : Container(
            child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => MyDeliveries(: widget.delivery)),
                  // );
                },
                child: GFListTile(
                  avatar: GFAvatar(
                    backgroundColor: GFColors.DARK,
                    child: Image.asset('assets/images/delivery_icon.png'),
                  ),
                  titleText: "Doc Name: " + widget.delivery.docName,
                  subTitleText:
                      "End Customer: " + widget.delivery.endCustomerName,
                  icon: GFBadge(
                    color: GFColors.WARNING,
                    //text: 'Pending',
                    shape: GFBadgeShape.circle,
                  ),
                )));
  }
}
