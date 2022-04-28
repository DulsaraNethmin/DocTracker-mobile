import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/mailModel.dart';
import 'package:doctracker/data/repository/mailRepo.dart';
import 'package:meta/meta.dart';

part 'mail_state.dart';

class MailCubit extends Cubit<MailState> {
  MailCubit() : super(MailLoading());

  Future getMails(String uuid) async {
    MailRepo mailRepo = MailRepo();
    final mail_state = state;
    try {
      List<Mail> sentMails = await mailRepo.getSentMail(uuid);
      List<Mail> receivedMails = await mailRepo.getReceivedMail(uuid);
      emit(MailLoaded(sentMails: sentMails, receivedMails: receivedMails));
    } catch (e) {
      print('error');
      print(e.toString());
    }
  }

  Future sendMail(Map body) async {
    MailRepo mailRepo = MailRepo();
    final mail_state = state;
    try {
      Mail mail = await mailRepo.sendMail(body);
      print(mail);
      List<Mail> arr = (mail_state is MailLoaded) ? mail_state.sentMails : [];
      List<Mail> arr2 =
          (mail_state is MailLoaded) ? mail_state.receivedMails : [];
      arr.add(mail);
      emit(MailLoaded(sentMails: arr, receivedMails: arr2));
    } catch (e) {
      print('error');
      print(e.toString());
    }
  }

  void toInitialState() {
    emit(MailLoading());
  }
}
