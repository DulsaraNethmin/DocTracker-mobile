import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit()
      : super(QrState(
            uuid: "",
            name: "",
            branch: "",
            department: "",
            type: deliverType.internal));

  void setQR(String uuid, String name, String branch, String department,
      deliverType type) {
    emit(QrState(
        uuid: uuid,
        name: name,
        branch: branch,
        department: department,
        type: type));
  }

  void setInternal() {
    emit(QrState(
        uuid: state.uuid,
        name: state.name,
        branch: state.branch,
        department: state.department,
        type: deliverType.internal));
  }

  void setExternal() {
    emit(QrState(
        uuid: state.uuid,
        name: state.name,
        branch: state.branch,
        department: state.department,
        type: deliverType.external));
  }
}
