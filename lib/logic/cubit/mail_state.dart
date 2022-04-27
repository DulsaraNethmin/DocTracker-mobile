part of 'mail_cubit.dart';

@immutable
abstract class MailState {}

class MailLoading extends MailState {}

class MailLoaded extends MailState {
  List<Mail> sentMails = [];
  List<Mail> receivedMails = [];
  MailLoaded({required this.sentMails, required this.receivedMails});
}
