import 'dart:convert';

import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/data/provider/deliveryProvider.dart';
import 'package:doctracker/logic/validators/get_token.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/step_card.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var step_1_state = false;
  var step_2_state = false;
  var step_3_state = false;
  void state() async {
    try {
      final deliveryProvider = Deliveryprovider();
      var res = await deliveryProvider.getdeliveryState(
          widget.delivery.deliveryId, getToken(context));
      //print(res);
      final en_data = jsonEncode(res.data);
      final data = jsonDecode(en_data);
      print(data[0]['state']);
      var s = data[0]['state'];
      switch (s) {
        case 0:
          break;
        case 1:
          setState(() {
            step_1_state = true;
          });
          break;
        case 2:
          setState(() {
            step_1_state = true;
            step_2_state = true;
          });
          break;
        case 3:
          setState(() {
            step_1_state = true;
            step_2_state = true;
            step_3_state = true;
          });
          break;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    state();
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
            is_done: step_1_state,
            step: 1,
          ),
          StepCard(
            is_done: step_2_state,
            step: 2,
          ),
          StepCard(
            is_done: step_3_state,
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
