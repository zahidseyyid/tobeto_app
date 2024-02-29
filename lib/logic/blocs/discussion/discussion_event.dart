abstract class DiscussionEvent {}

// Discussion fetch
class DiscussionFetchEvent extends DiscussionEvent {
  final String uid;

  DiscussionFetchEvent(this.uid);
}

class DiscussionResetEvent extends DiscussionEvent {}

class DiscussionDeleteEvent extends DiscussionEvent {
  final String uid;
  final String discussionId;

  DiscussionDeleteEvent({required this.uid, required this.discussionId});
}
