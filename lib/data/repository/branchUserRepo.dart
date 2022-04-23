import 'dart:convert';

import 'package:doctracker/data/provider/branchUserProvider.dart';
import 'package:doctracker/data/provider/userProvider.dart';

import '../model/userModel.dart';

class BranchUserRepo {
  BranchUserProvider _branchUserProvider = BranchUserProvider();
  Future<List<User>> getUser(String branch_id) async {
    final response =
        await _branchUserProvider.getUser('/user/get/all', branch_id);
    print(response.data);
    final data = response.data;
    List<User> arr = [];
    for (int i = 0; i < data.length; i++) {
      final jsonData = jsonEncode(data[i]);
      final jsondata2 = jsonDecode(jsonData);
      final doc_data = User.fromJson(jsondata2);
      arr.add(doc_data);
    }
    // final jsonData = jsonEncode(data);
    // print(jsonData);
    // final user = User.fromJson(jsonDecode(jsonData));
    // print("hi");
    return arr;
  }
}
