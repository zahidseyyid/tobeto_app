class AuthSignUpException {
  static String handleException(String e) {
    String errorMessage;
    switch (e) {
      case 'email-already-in-use':
        errorMessage = 'Bu email adresi zaten kullanımda.';
        break;
      case 'invalid-email':
        errorMessage = 'Geçersiz email adresi.';
        break;
      case 'operation-not-allowed':
        errorMessage =
            'İşlem izni yok. Email/password hesapları etkinleştirilmeli.';
        break;
      case 'weak-password':
        errorMessage = 'Zayıf şifre. Daha güçlü bir şifre seçin.';
        break;
      default:
        errorMessage = 'Beklenmeyen bir hata oluştu.';
    }
    return errorMessage;
  }
}

class AuthSignInException {
  static String handleException(String e) {
    String errorMessage;
    switch (e) {
      case 'invalid-email':
        errorMessage = 'Geçersiz email adresi.';
        break;
      case 'user-disabled':
        errorMessage = 'Kullanıcı devre dışı bırakıldı.';
        break;
      case 'user-not-found':
        errorMessage = 'Kullanıcı bulunamadı.';
        break;
      case 'wrong-password':
        errorMessage = 'Yanlış şifre. Tekrar dene';
        break;
      default:
        errorMessage = 'Beklenmeyen bir hata oluştu.';
    }
    return errorMessage;
  }
}
