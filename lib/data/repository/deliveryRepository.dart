import 'dart:convert';
import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/data/provider/deliveryProvider.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/logic/validators/get_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryRepository {
  final deliveryProvider = Deliveryprovider();
  Future<List<Delivery>> getAllDelivery(BuildContext context) async {
    final user_state = context.read<UserCubit>().state;
    final branch_id =
        (user_state is UserLogedin) ? user_state.user.branchId : "000";
    final branch = (user_state is UserLogedin) ? user_state.user.branch : "000";
    final token = getToken(context);
    final res = await deliveryProvider.getAllDelivery(branch_id, token);
    print(res);
    List<Delivery> arr = [];
    for (int i = 0; i < res.data.length; i++) {
      final jsonData = jsonEncode(res.data[i]);
      final jsondata2 = jsonDecode(jsonData);
      final delivery_data = Delivery.fromJson(jsondata2);
      arr.add(delivery_data);
    }
    return arr;
  }

  Future<List<Delivery>> getAllMyDelivery(BuildContext context) async {
    final user_state = context.read<UserCubit>().state;
    final uuid = (user_state is UserLogedin) ? user_state.uuid : "000";
    final token = getToken(context);
    final res = await deliveryProvider.getAllMyDelivery(uuid, token);
    print(res);
    List<Delivery> arr = [];
    for (int i = 0; i < res.data.length; i++) {
      final jsonData = jsonEncode(res.data[i]);
      final jsondata2 = jsonDecode(jsonData);
      final delivery_data = Delivery.fromJson(jsondata2);
      arr.add(delivery_data);
    }
    return arr;
  }
}
