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
  String nameSurname;

  AuthSignIn(
      {required this.eMail, required this.password, required this.nameSurname});
}

// Çıkış
class AuthLogout extends AuthEvent {}
