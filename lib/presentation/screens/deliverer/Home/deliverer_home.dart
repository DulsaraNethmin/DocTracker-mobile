import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DelivererHome extends StatelessWidget {
  //const DelivererHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliverer Home'),
        backgroundColor: kPrimaryColor,
      ),
      body:
          // SafeArea(
          //   child:
          Column(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 90.0),
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jane Doe',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            'Id: xxxxxxxxx',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/profile.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0,
              children: [
                selectBoxes(
                  //image: 'assets/images/logo.png',
                  name: 'Tracking',
                ),
                selectBoxes(
                  //image: 'assets/images/logo.png',
                  name: 'Payments',
                ),
              ],
            ),
          ),
        ],
      ),
      //),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

Widget selectBoxes({required String name}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.black, width: 2)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(
        //   height: 8,
        //   decoration:
        //       BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        // ),
        SizedBox(
          height: 3,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 5),
        ),
      ],
    ),
  );
}
