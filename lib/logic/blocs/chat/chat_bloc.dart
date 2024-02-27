import 'package:flutter_application_1/logic/blocs/chat/chat_event.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_state.dart';
import 'package:flutter_application_1/logic/repositories/chat_bot_repository.dart';
import 'package:flutter_application_1/models/chat_bot_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  ChatBloc(this._chatRepository) : super(ChatInitialState()) {
    on<ChatFetchEvent>(_onChatFetchEvent);
    on<ChatResetEvent>(_chatreset);
    on<ChatAddMessageEvent>(_onChatAddMessageEvent);
    on<ChatFetchResponseEvent>(_onChatFetchResponseEvent);
    // on<ChatAddFirstMessageEvent>(_onChatAddFirstMessageEvent);
  }

  void _onChatFetchEvent(ChatFetchEvent event, Emitter<ChatState> emit) async {
    emit(ChatFetchLoadingState());
    final chatMessages =
        await _chatRepository.getMessages(event.uid, event.discussionId);
    if (chatMessages.isNotEmpty) {
      emit(ChatFetchedState(chatMessages: chatMessages));
    } else {
      emit(ChatFetchErrorState(errorMessage: 'No messages found'));
    }
  }

  void _chatreset(ChatResetEvent event, Emitter<ChatState> emit) {
    emit(ChatInitialState());
  }

  void _onChatAddMessageEvent(
      ChatAddMessageEvent event, Emitter<ChatState> emit) async {
    if (state is ChatFetchedState) {
      ChatFetchedState fetchedState = state as ChatFetchedState;

      // Önceki mesajları güncellemeden önce yeni mesajı ekle
      List<ChatBotMessageModel> updatedMessages =
          List.from(fetchedState.chatMessages);
      updatedMessages.insert(0, ChatBotMessageModel(prompt: event.message));

      emit(ChatFetchedState(chatMessages: updatedMessages));
    }
  }

  void _onChatFetchResponseEvent(
      ChatFetchResponseEvent event, Emitter<ChatState> emit) async {
    if (state is ChatFetchedState) {
      ChatFetchedState fetchedState = state as ChatFetchedState;

      // Önceki mesajları güncellemeden önce yeni mesajı ekle
      List<ChatBotMessageModel> updatedMessages =
          List.from(fetchedState.chatMessages);

      String messageId = await _chatRepository.sendMessage(
          event.uid, event.discussionId, event.message);

      String response = await _chatRepository.listenToSpecificDocument(
          event.uid, event.discussionId, messageId);

      updatedMessages.insert(0, ChatBotMessageModel(response: response));

      emit(ChatFetchedState(chatMessages: updatedMessages));
    }
  }
}
