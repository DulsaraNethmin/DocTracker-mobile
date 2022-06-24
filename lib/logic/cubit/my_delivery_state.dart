part of 'my_delivery_cubit.dart';

@immutable
abstract class MyDeliveryState {}

class MyDeliveryInitial extends MyDeliveryState {}

class MyDeliveryLoading extends MyDeliveryState {}

class MyDeliveryLoaded extends MyDeliveryState {
  List<Delivery> my_delivery_list = [];
  Map<String, List<Delivery>> map = HashMap();
  MyDeliveryLoaded({required this.my_delivery_list, required this.map});
}

class MyDeliveryError extends MyDeliveryState {}
