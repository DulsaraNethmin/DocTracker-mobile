part of 'end_customer_cubit.dart';

@immutable
abstract class EndCustomerState {}

class EndCustomerInitial extends EndCustomerState {}

class EndCustomerSelected extends EndCustomerState {
  String name;
  String uuid;

  EndCustomerSelected({required this.name, required this.uuid});
}

class EndCustomerSelectError extends EndCustomerState {}
