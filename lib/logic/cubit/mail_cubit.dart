import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:meta/meta.dart';

part 'mail_state.dart';

class MailCubit extends Cubit<MailState> {
  MailCubit() : super(MailLoading());

  void sendMail(Mail mail) {}
}
