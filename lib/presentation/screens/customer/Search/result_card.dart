import 'package:flutter/material.dart';
import '../../../../data/model/documentModel.dart';

class ResultCard extends StatelessWidget {
  ResultCard({Key? key, required this.doc}) : super(key: key);
  Document doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Card(
          child: Column(
            children: [
              Text(doc.doc),
              SizedBox(
                height: 10,
              ),
              Text("Current Owner: ${doc.customerName}")
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
