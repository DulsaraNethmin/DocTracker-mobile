import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDoc extends StatelessWidget {
  const SearchDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0.8)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor)),
            hintText: "Search Document",
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            suffixIcon:
                IconButton(icon: const Icon(Icons.clear), onPressed: () {})),
      ),
    );

    return Scaffold(
      appBar: appBar('Search Document'),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search,
            //result
          ],
        ),
      ),
    );
  }
}
