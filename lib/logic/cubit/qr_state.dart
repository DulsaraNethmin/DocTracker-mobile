part of 'qr_cubit.dart';

enum deliverType { internal, external }

class QrState {
  String uuid;
  String name;
  String branch;
  String department;
  deliverType type;
  QrState({
    required this.uuid,
    required this.name,
    required this.branch,
    required this.department,
    required this.type,
  });
}
