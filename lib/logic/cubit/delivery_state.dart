part of 'delivery_cubit.dart';

@immutable
abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

class DeliveryLoaded extends DeliveryState {
  List<Delivery> delivery_list = [];
  DeliveryLoaded({required this.delivery_list});
}

class DeliveryError extends DeliveryState {}
