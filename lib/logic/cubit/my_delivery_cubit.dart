import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/data/repository/deliveryRepository.dart';
import 'package:doctracker/logic/algorithms/delivery_management.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'my_delivery_state.dart';

class MyDeliveryCubit extends Cubit<MyDeliveryState> {
  MyDeliveryCubit() : super(MyDeliveryInitial());

  void getAllMyDelivery(BuildContext context) async {
    final deliveryRepository = DeliveryRepository();
    try {
      emit(MyDeliveryLoading());
      List<Delivery> list = await deliveryRepository.getAllDelivery(context);
      Map<String, List<Delivery>> map = getJbosAndDeliveris(list);
      print("deliveries fetched");
      emit(MyDeliveryLoaded(my_delivery_list: list, map: map));
    } catch (e) {
      emit(MyDeliveryError());
    }
  }
}
