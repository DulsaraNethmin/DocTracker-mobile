import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit()
      : super(QrState(
          uuid: "",
          branch: "",
        ));

  void setQR(String uuid, String branch) {
    emit(QrState(
      uuid: uuid,
      branch: branch,
    ));
  }

  void setInternal() {
    emit(QrState(
      uuid: state.uuid,
      branch: state.branch,
    ));
  }

  void setExternal() {
    emit(QrState(
      uuid: state.uuid,
      branch: state.branch,
    ));
  }

  void reset() {
    emit(QrState(uuid: '', branch: ''));
  }
}
