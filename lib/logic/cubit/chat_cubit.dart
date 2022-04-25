import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/chatModel.dart';
import 'package:doctracker/data/model/messageModel.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoading());

  void getChats() {
    emit(ChatLoad(state.))
  }

  void addIncomingChat(Chat chat, Message message) {
    emit(ChatIncoming(chat, message));
  }

  void addOutgoingChat(Chat chat, Message message) {
    emit(ChatOutgoing(chat, message));
  }
}
