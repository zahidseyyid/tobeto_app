import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_event.dart';

import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/logic/repositories/auth_repository.dart';
import 'package:tobeto_app/logic/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final UserBloc _userBloc;

  AuthBloc(this._authRepository, this._userRepository, this._userBloc)
      : super(AuthInitial()) {
    on<AuthAppStarted>(_onAppStarted);
    on<AuthSignIn>(_onSignInUser);
    on<AuthSignUp>(_onSignUpUser);
    on<AuthLogout>(_onUserLogout);
    on<AuthPasswordReset>(_onPasswordReset);
    on<AuthDeleteUser>(_onDeleteUser);
  }

  // Uygulama açıldığında splash ekranda auth sorgusu yapılır
  void _onAppStarted(AuthAppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Kullanıcı oturum durumunu kontrol et
      final isLoggedIn = await _authRepository.isLoggedIn();
      if (isLoggedIn) {
        final userId = _authRepository.getUserId();
        emit(Authenticated(userId));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  // Kullanıcı girişi
  void _onSignInUser(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final loginUser =
        await _authRepository.loginUserWithEmail(event.eMail, event.password);

    if (loginUser is User) {
      User user = loginUser;
      emit(Authenticated(user.uid));
    } else {
      emit(loginUser is String
          ? AuthError(errorMessage: loginUser)
          : AuthError(errorMessage: "Beklenmeyen bir hata oluştu"));
    }
  }

  // Kullanıcı Kayıt
  void _onSignUpUser(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final registerUser = await _authRepository.createUserWithEmail(
        event.eMail, event.password, event.nameSurname);
    if (registerUser is User) {
      await _userRepository.createUser(
        event.eMail,
        registerUser.uid,
        event.nameSurname,
      );
      emit(Authenticated(registerUser.uid));
    } else {
      emit(registerUser is String
          ? AuthError(errorMessage: registerUser)
          : AuthError(errorMessage: "Beklenmeyen bir hata oluştu"));
    }
  }

  // Kullanıcı çıkış
  void _onUserLogout(AuthLogout event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.userLogout();
      _userBloc.add(UserDeleteEvent());
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(errorMessage: "${e}Giriş Başarısız"));
    }
  }

  // Şifre sıfırlama
  void _onPasswordReset(
      AuthPasswordReset event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.resetPassword(event.eMail);
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  // Kullanıcı silme
  void _onDeleteUser(AuthDeleteUser event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.deleteUser();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
