part of 'chat_cubit.dart';

@immutable
abstract class ChatState {
  List<Chat> chat = [];
  List<Message> message = [];
}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {}

class ChatLoaded extends ChatState {
  ChatLoaded(List<Chat> c, List<Message> m) {
    chat = c;
    message = m;
  }
}

class ChatIncoming extends ChatState {
  ChatIncoming(Chat c, Message m) {
    chat.add(c);
    message.add(m);
  }
}

class ChatOutgoing extends ChatState {
  ChatOutgoing(Chat c, Message m) {
    chat.add(c);
    message.add(m);
  }
}
