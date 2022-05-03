import 'package:flutter/material.dart';
import '../../../../data/model/documentModel.dart';

class ResultCard extends StatelessWidget {
  ResultCard({Key? key, required this.doc}) : super(key: key);
  Document doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: InkWell(
        child: Card(
          color: Color.fromARGB(255, 196, 187, 197),
          child: Container(
            width: MediaQuery.of(context).size.width - 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.doc,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Branch: ${doc.branch}",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Current Owner: ${doc.customerName}",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
