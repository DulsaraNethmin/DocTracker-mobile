part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {}

class ChatLoaded extends ChatState {
  ChatLoaded({required this.chat});
  List<Chat> chat;
}

class ChatIncoming extends ChatState {}

class ChatOutgoing extends ChatState {}
