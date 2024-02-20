import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/firebase_auth_exception.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> userLogout() async {
    _auth.signOut();
  }

  Future<bool> isLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  String? getUserId() {
    final user = _auth.currentUser;
    return user?.uid; // Kullanıcı kimlik bilgisini döndür
  }
}

// future daki async kaldır

  // Future<String?> getUserId() async {
  //   final user = _auth.currentUser;
  //   return user?.uid; // Kullanıcı kimlik bilgisini döndür
  // }