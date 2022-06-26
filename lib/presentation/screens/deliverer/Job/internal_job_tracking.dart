import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/step_card.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';

class InternalJobTracking extends StatefulWidget {
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
  InternalJobTracking({required this.delivery});

  @override
  State<InternalJobTracking> createState() => _InternalJobTrackingState();
}

class _InternalJobTrackingState extends State<InternalJobTracking> {
  @override
  Widget build(BuildContext context) {
    final top_card = GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        image: Image.asset(
          'assets/images/job_card_image.jpg',
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        showImage: true,
        title: GFListTile(
          avatar: GFAvatar(
            backgroundColor: GFColors.LIGHT,
            backgroundImage: AssetImage('assets/images/delivery_icon.png'),
          ),
          titleText: widget.delivery.docName,
          subTitleText: (widget.delivery.isJobCompleted == 0)
              ? "Open Job"
              : (widget.delivery.isJobCompleted == 1)
                  ? "Pending Job"
                  : "Finished",
        ),
        content: Text('End Customer: ${widget.delivery.endCustomerName}'));
    return Scaffold(
      appBar: appBar('Delivery Statet'),
      body: Column(
        children: [
          top_card,
          StepCard(
            is_done: false,
            step: 1,
          ),
          StepCard(
            is_done: false,
            step: 2,
          ),
          StepCard(
            is_done: false,
            step: 3,
          ),
          GFButton(
            color: GFColors.SECONDARY,
            onPressed: () {},
            text: "Done",
          )
        ],
      ),
    );
  }
}
