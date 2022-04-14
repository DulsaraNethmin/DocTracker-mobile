import 'package:flutter/material.dart';

import '../../../../data/model/documentModel.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({Key? key, Document? doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Card(
          child: Column(
            children: [
              Text("This is Doc Name"),
              SizedBox(
                height: 10,
              ),
              Text("This is description of the doc....")
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
