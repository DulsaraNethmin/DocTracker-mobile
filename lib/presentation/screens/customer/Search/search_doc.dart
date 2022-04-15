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
    final state = context.read<DocumentCubit>().state;
    if (!(state is DocumentLoaded)) {
      context.read<DocumentCubit>().getAllDocs(context);
    }
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
        if (state is DocumentLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator.adaptive()),
            ],
          );
        } else if (state is DocumentLoaded) {
          return SearchResult(
            arr: state.docs,
          );
        }
        return CircularProgressIndicator();
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
