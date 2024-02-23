// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/utils/firebase_firestore_exception.dart';

class UserRepository {
  //TODO: users collection_names ten alınabilir
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> createUser(String email, String uid, String nameSurname) async {
    try {
      UserProfile userProfile =
          UserProfile(uid: uid, email: email, nameSurname: nameSurname);
      await collectionReference.doc(uid).set(userProfile.toFirestore());
    } catch (e) {
      String errorMessage = FirestoreExceptionHelper.handleException(e);
      throw Exception(errorMessage);
    }
  }

  Future<Object> fetchUser(String uid) async {
    try {
      final userProfileDb = await collectionReference.doc(uid).get();
      final userProfile = UserProfile.fromFirestore(userProfileDb);
      return userProfile;
    } catch (e) {
      String errorMessage = FirestoreExceptionHelper.handleException(e);
      return errorMessage;
    }
  }

  Future<void> updateUser(UserProfile userProfile, String uid) async {
    try {
      await collectionReference.doc(uid).update(userProfile.toFirestore());
    } catch (e) {
      print("${e}Hata kodu burada");
      String errorMessage = FirestoreExceptionHelper.handleException(e);
      throw Exception(errorMessage);
    }
  }
}
