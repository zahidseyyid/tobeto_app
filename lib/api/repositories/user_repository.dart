import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/api/repositories/auth_repository.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserRepository {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");
  final String? currentUserId = AuthRepository().returnUid(); // Null olabilir

  Future<void> createUser(String email, String uid, String nameSurname) async {
    if (currentUserId != null) {
      // Null kontrolü
      UserProfile userProfile =
          UserProfile(idNo: uid, email: email, nameSurname: nameSurname);
      await collectionReference
          .doc(currentUserId!)
          .set(userProfile.toFirestore());
    } else {
      // Null olduğunda yapılacak işlemler buraya eklenebilir
      print("Current user ID is null.");
    }
  }
}
