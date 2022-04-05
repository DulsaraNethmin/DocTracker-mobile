import 'package:bloc/bloc.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketState(socket: null));

  void connect(BuildContext context) {
    emit(SocketState(
        socket: IO.io(
            "https://intense-anchorage-44762.herokuapp.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    })));
    print("inside");
    state.socket!.connect();
    String id = context.read<UserCubit>().state.uuid;
    state.socket!.emit('signin', id);
    state.socket!.onConnect((data) {
      print("connected");
      state.socket!.on('msg', (msg) {
        print(msg);
        //setMessages("target", msg["message"], msg["time"]);
        //_scrollController.animateTo(_scrollController.position.maxScrollExtent,
        //    duration: Duration(microseconds: 300), curve: Curves.easeOut);
      });
    });
    print(state.socket!.connected);
  }
}
