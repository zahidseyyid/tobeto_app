import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserRepository {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> createUser(String email, String uid, String nameSurname) async {
    UserProfile userProfile =
        UserProfile(idNo: uid, email: email, nameSurname: nameSurname);
    await collectionReference.doc(uid).set(userProfile.toFirestore());
  }

  Future<UserProfile> fetchUser(String uid) async {
    final userProfileDb = await collectionReference.doc(uid).get();
    final userProfile = UserProfile.fromFirestore(userProfileDb);
    return userProfile;
  }

  Future<void> updateUser(UserProfile userProfile, String uid) async {
    collectionReference.doc(uid).update(userProfile.toFirestore());
  }
}
