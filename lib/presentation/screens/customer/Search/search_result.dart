import 'package:doctracker/presentation/screens/customer/Search/result_card.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/documentModel.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key, required this.arr}) : super(key: key);
  List<Document> arr = [];
  @override
  Widget build(BuildContext context) {
    List<ResultCard> card = [];
    for (int i = 0; i < arr.length; i++) {
      card.add(ResultCard(
        doc: arr[i],
      ));
    }
    return SingleChildScrollView(
      child: Column(
        children: card,
      ),
    );
  }
}
