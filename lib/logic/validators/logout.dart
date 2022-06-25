import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/doc_request_cubit.dart';
import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:doctracker/logic/cubit/image_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void LogOut(BuildContext context) {
  final user_state = context.read<UserCubit>().state;
  final user_id = (user_state is UserLogedin) ? user_state.uuid : "000";
  final user_type = (user_state is UserLogedin) ? user_state.user.role : "000";
  final socket_state = context.read<SocketCubit>().state;
  if (user_type == "Customer") {
    print('logout');
    context.read<BranchUserCubit>().toInitialState();
    context.read<DocumentCubit>().toInitialState();
    context.read<MailCubit>().toInitialState();
    context.read<ImageCubit>().toInitialState();
    context.read<QrCubit>().initial();
    context.read<BotnavbarCubit>().toInitialState();
    context.read<DocRequestCubit>().toInitialState();
    if (socket_state is SocketConnected) {
      socket_state.socket.emit('end', user_id);
      socket_state.socket.disconnect();
    }
  } else {
    print('logout');
    context.read<BranchUserCubit>().toInitialState();
    context.read<DocumentCubit>().toInitialState();
    context.read<MailCubit>().toInitialState();
    context.read<ImageCubit>().toInitialState();
    context.read<QrCubit>().initial();
    context.read<BotnavbarCubit>().toInitialState();
    context.read<DocRequestCubit>().toInitialState();
    if (socket_state is SocketConnected) {
      socket_state.socket.emit('end', user_id);
      socket_state.socket.disconnect();
    }
  }

  context.read<SocketCubit>().toInitialState();
  Navigator.of(context)
      .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
}

final error_snack_bar = SnackBar(
  backgroundColor: Color.fromARGB(255, 241, 43, 28),
  behavior: SnackBarBehavior.floating,
  content: Center(
      child: Text(
    '    Verification Faild.Please Sign in.',
    style: TextStyle(fontWeight: FontWeight.bold),
  )),
);
