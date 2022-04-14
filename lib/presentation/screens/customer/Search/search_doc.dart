import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_result.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDoc extends StatelessWidget {
  const SearchDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DocumentCubit>().getAllDocs(context);
    var no_of_docs = context.read<DocumentCubit>().state.docs.length;
    print(no_of_docs);
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

    final result = BlocBuilder<DocumentCubit, DocumentState>(
      builder: (context, state) {
        return SearchResult(
          arr: state.docs,
        );
      },
    );
    return Scaffold(
      appBar: appBar('Search Document'),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [search, result],
        ),
      ),
    );
  }
}
