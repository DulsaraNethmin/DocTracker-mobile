import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/data/repository/qrRepo.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());

  Future verify(String url) async {
    QrRepo qr_repo = QrRepo();
    try {
      QrScan qr_scan_data = await qr_repo.verify(url);
      emit(QrVerified(scan_data: qr_scan_data));
    } catch (e) {
      print('error');
      print(e.toString());
      emit(QrVerifingError());
    }
  }

  // void setQR(String uuid, String branch) {
  //   emit(QrState(
  //     uuid: uuid,
  //     branch: branch,
  //   ));
  // }

  // void setInternal() {
  //   emit(QrState(
  //     uuid: state.uuid,
  //     branch: state.branch,
  //   ));
  // }

  // void setExternal() {
  //   emit(QrState(
  //     uuid: state.uuid,
  //     branch: state.branch,
  //   ));
  // }

  // void reset() {
  //   emit(QrState(uuid: '', branch: ''));
  // }
}
