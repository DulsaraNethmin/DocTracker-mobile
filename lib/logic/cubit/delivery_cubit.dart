import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/data/repository/deliveryRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitial());

  void getAllDelivery(BuildContext context) async {
    final deliveryRepository = DeliveryRepository();
    try {
      emit(DeliveryLoading());
      List<Delivery> list = await deliveryRepository.getAllDelivery(context);
      emit(DeliveryLoaded(delivery_list: list));
    } catch (e) {
      emit(DeliveryError());
    }
  }
}
