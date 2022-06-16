import 'package:doctracker/data/model/documentModel.dart';
import 'package:doctracker/logic/algorithms/doc_search.dart';
import 'package:doctracker/logic/cubit/doc_search_cubit.dart';
import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_result.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDoc extends StatefulWidget {
  const SearchDoc({Key? key}) : super(key: key);

  @override
  State<SearchDoc> createState() => _SearchDocState();
}

class _SearchDocState extends State<SearchDoc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DocSearchCubit>().toInitialState();
  }

  List<Document> doc_list = [];
  @override
  Widget build(BuildContext context) {
    print("reloaded");
    final state = context.read<DocumentCubit>().state;
    final search_state = context.read<DocSearchCubit>().state;

    if (!(state is DocumentLoaded)) {
      context.read<DocumentCubit>().getAllDocs(context);
    }
    final search = Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: (val) {
          //print(val);
          // if (!(search_state is DocSearching))
          //   context.read<DocSearchCubit>().docSearching();
          context.read<DocSearchCubit>().docSearching();
          setState(() {
            doc_list = searchByName(val, context);
            //print(doc_list.length);
          });
        },
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
          return BlocBuilder<DocSearchCubit, DocSearchState>(
              builder: (context, dstate) {
            if (dstate is DocSearching) {
              print(doc_list.length);
              return SearchResult(arr: doc_list);
            }
            return SearchResult(arr: state.docs);
          });
        }
        return CircularProgressIndicator();
      },
    );

    final search_result =
        BlocBuilder<DocSearchCubit, DocSearchState>(builder: (context, state) {
      if (state is DocSearching) {
        print(doc_list.length);
        return SearchResult(arr: doc_list);
      }
      return SearchResult(arr: []);
    });
    return Scaffold(
      appBar: appBar('Search Document'),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search,
            result,
          ],
        ),
      ),
    );
  }
}
