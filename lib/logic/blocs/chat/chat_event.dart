abstract class ChatEvent {}

/* ------------------- Chat Events ------------------- */

// Chat fetch event
class ChatFetchEvent extends ChatEvent {
  final String uid;
  final String discussionId;

  ChatFetchEvent({required this.uid, required this.discussionId});
}

// Chat add message event
class ChatAddMessageEvent extends ChatEvent {
  final String uid;
  final String discussionId;
  final String message;

  ChatAddMessageEvent(
      {required this.message, required this.uid, required this.discussionId});
}

class ChatFetchResponseEvent extends ChatEvent {
  final String uid;
  final String discussionId;
  final String message;

  ChatFetchResponseEvent(
      {required this.uid, required this.discussionId, required this.message});
}

// Chat add first message event
class ChatAddFirstMessageEvent extends ChatEvent {
  final String uid;
  final String message;

  ChatAddFirstMessageEvent({required this.uid, required this.message});
}

class ChatResetEvent extends ChatEvent {}
