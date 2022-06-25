part of 'delivery_cubit.dart';

@immutable
abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

class DeliveryLoaded extends DeliveryState {
  List<Delivery> delivery_list = [];
  Map<String, List<Delivery>> map = HashMap();
  DeliveryLoaded({required this.delivery_list, required this.map});
}

class DeliveryError extends DeliveryState {}
