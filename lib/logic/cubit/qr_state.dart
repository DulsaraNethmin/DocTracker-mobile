part of 'qr_cubit.dart';

@immutable
abstract class QrState {}

class QrInitial extends QrState {}

class QrVerified extends QrState {
  QrScan scan_data;
  QrVerified({required this.scan_data});
}

class QrVerifing extends QrState {}

class QrVerifingError extends QrState {}
