import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'end_customer_state.dart';

class EndCustomerCubit extends Cubit<EndCustomerState> {
  EndCustomerCubit() : super(EndCustomerInitial());

  void selectEndCustomer(String name, String uuid) {
    emit(EndCustomerSelected(name: name, uuid: uuid));
  }
}
