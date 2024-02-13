import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserUpdateEvent>(_onUserUpdateEvent);
    on<UserFetchEvent>(_onUserFetchEvent);
  }

  void _onUserUpdateEvent(
      UserUpdateEvent event, Emitter<UserState> emit) async {}

  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {}
}
