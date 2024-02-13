import 'package:flutter_application_1/models/user_model.dart';

abstract class UserEvent {}

class UserUpdateEvent extends UserEvent {
  final UserProfile userProfile;

  UserUpdateEvent({required this.userProfile});
}

class UserFetchEvent extends UserEvent {
  final String userId;

  UserFetchEvent({required this.userId});
}
