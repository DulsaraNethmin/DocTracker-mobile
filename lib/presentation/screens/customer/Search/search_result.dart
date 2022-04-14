import 'package:doctracker/presentation/screens/customer/Search/result_card.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResultCard(),
          ResultCard(),
          ResultCard(),
          ResultCard(),
          ResultCard(),
          ResultCard(),
          ResultCard()
        ],
      ),
    );
  }
}
