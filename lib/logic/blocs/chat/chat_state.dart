import 'package:flutter_application_1/models/chat_bot_model.dart';

abstract class ChatState {}

/* ------------------- Chat States ------------------- */

// Chat initial state
class ChatInitialState extends ChatState {}

// Chat message added state
class ChatMessageAddedState extends ChatState {}

// Chat first message added state
class ChatFirstMessageAddedState extends ChatState {
  final ChatBotMessageModel message;

  ChatFirstMessageAddedState({required this.message});
}

// Chat fetched state
class ChatFetchedState extends ChatState {
  final List<ChatBotMessageModel> chatMessages;

  ChatFetchedState({required this.chatMessages});
}

// Chat fetch loading state
class ChatFetchLoadingState extends ChatState {}

// Chat fetch error state
class ChatFetchErrorState extends ChatState {
  final String errorMessage;

  ChatFetchErrorState({required this.errorMessage});
}
