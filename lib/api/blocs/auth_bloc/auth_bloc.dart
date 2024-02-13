import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_event.dart';

import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/api/repositories/auth_repository.dart';
import 'package:flutter_application_1/api/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthBloc(this._authRepository, this._userRepository) : super(AuthInitial()) {
    on<AuthAppStarted>(_onAppStarted);
    on<AuthSignUp>(_onSignUpUser);
    on<AuthSignIn>(_onSignInUser);
    on<AuthLogout>(_onUserLogout);
  }

  // Uygulama açıldığında splash ekranda auth sorgusu yapılır
  void _onAppStarted(AuthAppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Kullanıcı oturum durumunu kontrol et
      final isLoggedIn = await _authRepository.isLoggedIn();
      if (isLoggedIn) {
        final userId = await _authRepository.getUserId();
        emit(Authenticated(userId));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Kullanıcı girişi
  void _onSignUpUser(AuthSignUp event, Emitter<AuthState> emit) async {
    try {
      User? user =
          await _authRepository.loginUserWithEmail(event.eMail, event.password);
      emit(Authenticated(user!.uid.toString()));
    } catch (e) {
      emit(AuthError("${e}Giriş Başarısız"));
    }
  }

  // Kullanıcı Kayıt
  void _onSignInUser(AuthSignIn event, Emitter<AuthState> emit) async {
    try {
      User? user = await _authRepository.createUserWithEmail(
          event.eMail, event.password, event.nameSurname);
      await _userRepository.createUser(
        event.eMail,
        _authRepository.returnUid()!,
        _authRepository.returnName()!,
      );
      emit(Authenticated(user!.uid.toString()));
    } catch (e) {
      emit(AuthError("${e}Giriş Başarısız"));
    }
  }

  // Kullanıcı çıkış
  void _onUserLogout(AuthLogout event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.userLogout();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError("${e}Giriş Başarısız"));
    }
  }
}
