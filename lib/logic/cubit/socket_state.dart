part of 'socket_cubit.dart';

class SocketState {
  List<MessageModel> messages = [];
  IO.Socket? socket;
  SocketState({required this.socket, required this.messages});
}
