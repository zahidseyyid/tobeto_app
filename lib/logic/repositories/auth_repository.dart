import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/firebase_auth_exception.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Bu fonksiyon, verilen e-posta, şifre ve isim ile yeni bir kullanıcı oluşturur.
  // Başarılı bir oluşturma durumunda, oluşturulan kullanıcıyı döndürür.
  // Hata durumunda, hata mesajını döndürür.
  Future<Object?> createUserWithEmail(String email, password, name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: deprecated_member_use
      await userCredential.user!.updateProfile(displayName: name);
      return userCredential.user;
    } catch (e) {
      String errorMessage = AuthSignUpException.handleException(e);
      return errorMessage;
    }
  }

  // Bu fonksiyon, verilen e-posta ve şifre ile kullanıcı girişi yapar.
  // Başarılı bir giriş durumunda, giriş yapan kullanıcıyı döndürür.
  // Hata durumunda, hata mesajını döndürür.
  Future<Object?> loginUserWithEmail(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      String errorMessage = AuthSignInException.handleException(e);
      return errorMessage;
    }
  }

  // Bu fonksiyon, mevcut kullanıcının oturumunu kapatır.
  Future<void> userLogout() async {
    _auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteUser() async {
    final user = _auth.currentUser;
    await user!.delete();
  }

  // Bu fonksiyon, bir kullanıcının oturum açıp açmadığını kontrol eder.
  // Kullanıcı oturum açmışsa true, oturum açmamışsa false döndürür.
  Future<bool> isLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  // Bu fonksiyon, mevcut kullanıcının kimlik bilgisini (ID) döndürür.
  String? getUserId() {
    final user = _auth.currentUser;
    return user?.uid; // Kullanıcı kimlik bilgisini döndür
  }
}
