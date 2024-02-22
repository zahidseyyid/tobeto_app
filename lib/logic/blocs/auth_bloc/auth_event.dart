abstract class AuthEvent {}

class AuthAppStarted extends AuthEvent {}

// Giriş
class AuthSignIn extends AuthEvent {
  String eMail;
  String password;

  AuthSignIn({required this.eMail, required this.password});
}

// Kayıt
class AuthSignUp extends AuthEvent {
  String eMail;
  String password;
  String nameSurname;

  AuthSignUp(
      {required this.eMail, required this.password, required this.nameSurname});
}

// Çıkış
class AuthLogout extends AuthEvent {
  //TODO: Silme eventi eklenebilir belki
}
