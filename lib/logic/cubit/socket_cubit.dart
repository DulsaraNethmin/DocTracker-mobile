import 'package:bloc/bloc.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketInitial());

  void connect(BuildContext context) async {
    IO.Socket socket;
    socket = await IO.io(realTime, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true
    });
    socket.connect();
    final user_state = context.read<UserCubit>().state;
    String id = (user_state is UserLogedin) ? user_state.uuid : "000";
    socket.emit('signin', id);
    socket.onConnect((data) {
      print("connected");
      emit(SocketConnected(socket: socket));
    });
    print(socket.connected);
    // socket.on('incoming_mail', (msg) async {
    //   print("msg msg");
    //   await context.read<MailCubit>().getMails(id);
    // });
  }

  void toInitialState(IO.Socket socket) {
    socket.disconnect();
    emit(SocketInitial());
  }
}
