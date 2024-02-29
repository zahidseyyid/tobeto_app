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
    on<ChatAddFirstMessageEvent>(_onChatFirstMessage);
    on<ChatEmptyDiscussionEvent>(_onChatEmptyDiscussion);
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
    } else if (state is ChatFirstMessageAddedState) {
      List<ChatBotMessageModel> newMessages = [];
      newMessages.add(ChatBotMessageModel(prompt: event.message));
      emit(ChatFetchedState(chatMessages: newMessages));
    }
  }

  void _onChatFetchResponseEvent(
      ChatFetchResponseEvent event, Emitter<ChatState> emit) async {
    if (state is ChatFetchedState) {
      ChatFetchedState fetchedState = state as ChatFetchedState;

      List<ChatBotMessageModel> updatedMessages =
          List.from(fetchedState.chatMessages);

      print("onChatFetchResponseEvent${event.discussionId}");
      print("onChatFetchResponseEvent${event.uid}");
      print("onChatFetchResponseEvent${event.message}");

      List<String> idList = await _chatRepository.sendMessage(
          event.uid, event.discussionId, event.message);

      String messageId = idList[0];
      String discussionId = idList[1];

      String response = await _chatRepository.listenToSpecificDocument(
          event.uid, discussionId, messageId);

      // Mevcut mesajın response'unu güncelle
      if (updatedMessages.isNotEmpty) {
        updatedMessages[0].updateResponse(response);
      }

      emit(ChatFetchedState(chatMessages: updatedMessages));
    }
  }

  void _onChatFirstMessage(
      ChatAddFirstMessageEvent event, Emitter<ChatState> emit) {
    emit(ChatFirstMessageAddedState());
  }

  void _onChatEmptyDiscussion(
      ChatEmptyDiscussionEvent event, Emitter<ChatState> emit) {
    emit(ChatEmptyDiscussion());
  }
}
