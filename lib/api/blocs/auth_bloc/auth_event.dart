abstract class AuthEvent {}

class AuthAppStarted extends AuthEvent {}

// Giriş
class AuthSignUp extends AuthEvent {
  String eMail;
  String password;

  AuthSignUp({required this.eMail, required this.password});
}

// Kayıt
class AuthSignIn extends AuthEvent {
  String eMail;
  String password;

  AuthSignIn({required this.eMail, required this.password});
}

// Çıkış
class AuthLogout extends AuthEvent {}
