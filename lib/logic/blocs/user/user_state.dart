import 'package:tobeto_app/models/user_model.dart';

abstract class UserState {}

// Başlangıç
class UserInitialState extends UserState {}

// User bilgileri başarıyla güncellendi
class UserUpdated extends UserState {}

// User bilgileri güncelleme sırasındaki hata
class UserUpdateErrorState extends UserState {
  final String updateErrorMessage;

  UserUpdateErrorState({required this.updateErrorMessage});
}

// User bilgilerinin yüklenme durumu
class UserFetchLoadingState extends UserState {}

// User bilgilerinin çekilmesi sırasındaki hata
class UserFetchErrorState extends UserState {
  final String errorMessage;

  UserFetchErrorState({required this.errorMessage});
}

// User bilgilerinin çekildiği aşama
class UserFetchedState extends UserState {
  final UserProfile? user;

  UserFetchedState(this.user);
}

class UserDeletedState extends UserState {}
