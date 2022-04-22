import 'package:doctracker/data/model/userModel.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Chat/custom_card_search.dart';
import 'package:doctracker/presentation/screens/customer/Search/result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/documentModel.dart';

class SearchResultUsers extends StatelessWidget {
  SearchResultUsers({Key? key, required this.arr}) : super(key: key);
  List<User> arr = [];
  @override
  Widget build(BuildContext context) {
    List<CustomCardSearch> card = [];
    for (int i = 0; i < arr.length; i++) {
      if (arr[i].uuid != context.read<UserCubit>().state.uuid)
        card.add(CustomCardSearch(
          user: arr[i],
        ));
    }
    return SingleChildScrollView(
      child: Column(
        children: card,
      ),
    );
  }
}
