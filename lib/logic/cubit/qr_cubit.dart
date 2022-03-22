import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrState(uuid: "", name: "", branch: "", department: ""));

  void setQR(String uuid, String name, String branch, String department) {
    emit(QrState(
        uuid: uuid, name: name, branch: branch, department: department));
  }
}
