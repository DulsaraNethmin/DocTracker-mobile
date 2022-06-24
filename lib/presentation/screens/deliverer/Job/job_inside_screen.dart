import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class JobInside extends StatelessWidget {
  List<Delivery>? list;
  JobInside({required this.list});

  @override
  Widget build(BuildContext context) {
    final job_card = GFCard(
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
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        titleText: list![0].customerName,
        subTitleText: 'PlayStation 4',
      ),
      content: Text("Some quick example text to build on the card"),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFAvatar(
            backgroundColor: GFColors.PRIMARY,
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          GFAvatar(
            backgroundColor: GFColors.SECONDARY,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          GFAvatar(
            backgroundColor: GFColors.SUCCESS,
            child: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Job'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(children: [job_card]),
    );
  }
}
