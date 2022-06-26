import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/custom_card_my_deliveries.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MyDeliveries extends StatelessWidget {
  List<Delivery>? list = [];
  MyDeliveries({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Job By : ${list![0].customerName}'),
        body: ListView.builder(
            itemCount: list!.length,
            itemBuilder: (context, index) {
              return MyDeliveryCard(delivery: list![index]);
            }));
  }
}
