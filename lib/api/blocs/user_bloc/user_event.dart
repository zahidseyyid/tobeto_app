abstract class UserEvent {}

class UserUpdateEvent extends UserEvent {
  final String userId;

  UserUpdateEvent({required this.userId});
}

class UserFetchEvent extends UserEvent {
  final String userId;

  UserFetchEvent({required this.userId});
}
