part of 'qr_cubit.dart';

enum deliverType { internal, external }

class QrState {
  String uuid;
  String branch;
  QrState({
    required this.uuid,
    required this.branch,
  });
}
