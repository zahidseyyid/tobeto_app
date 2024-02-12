abstract class AuthState {}

// Başlangıç
class AuthInitial extends AuthState {}

// Yüklenme
class AuthLoading extends AuthState {}

// Başarılı Giriş
class Authenticated extends AuthState {
  final String? userId;

  Authenticated(this.userId);
}

// Başarısız Giriş
class Unauthenticated extends AuthState {}

// Hatalı Giriş
class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
