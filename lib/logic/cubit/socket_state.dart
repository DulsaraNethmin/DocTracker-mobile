part of 'socket_cubit.dart';

@immutable
abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketConnected extends SocketState {
  IO.Socket socket;
  SocketConnected({required this.socket});
}
