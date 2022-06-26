import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class StepCard extends StatefulWidget {
  bool is_done = false;
  int step = 1;

  StepCard({required this.is_done, required this.step});

  @override
  State<StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<StepCard> {
  @override
  Widget build(BuildContext context) {
    return GFListTile(
        avatar: GFAvatar(
          backgroundColor: GFColors.LIGHT,
          child: Image.asset('assets/images/job_icon.png'),
        ),
        titleText: (widget.step == 1)
            ? 'Step 01'
            : (widget.step == 2)
                ? "Step 02"
                : "Step 03",
        subTitleText: (widget.step == 1)
            ? 'Accept the document from the customer.'
            : (widget.step == 2)
                ? "Deliver to the End customer."
                : "Finish the Job",
        icon: (!widget.is_done)
            ? Icon(Icons.circle_outlined)
            : Icon(
                Icons.done,
                color: Colors.green,
              ));
  }
}
