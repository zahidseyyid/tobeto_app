import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/api/repositories/user_repository.dart';
import 'package:flutter_application_1/models/user_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserUpdateEvent>(_onUserUpdateEvent);
    on<UserFetchEvent>(_onUserFetchEvent);
  }

  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState());
    try {
      UserProfile userProfile = await _userRepository.fetchUser(event.userId);
      emit(UserFetchedState(userProfile));
    } catch (e) {
      emit(UserFetchErrorState(errorMessage: e.toString()));
    }
  }

  void _onUserUpdateEvent(
      UserUpdateEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState());
    try {
      await _userRepository.updateUser(event.userProfile, event.userId);
      emit(UserInitialState());
    } catch (e) {
      emit(UserUpdateErrorState(updateErrorMessage: e.toString()));
    }
  }
}
