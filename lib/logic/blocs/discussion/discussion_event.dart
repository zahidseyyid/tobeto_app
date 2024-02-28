abstract class DiscussionEvent {}

// Discussion fetch
class DiscussionFetchEvent extends DiscussionEvent {
  final String uid;

  DiscussionFetchEvent(this.uid);
}

class DiscussionResetEvent extends DiscussionEvent {}
