part of 'mail_cubit.dart';

@immutable
abstract class MailState {}

class MailLoading extends MailState {}

class MailLoaded extends MailState {
  List<Mail> mails = [];
  MailLoaded({required this.mails});
}
