import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/collection_names.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/announcements_model.dart';

class AnnouncementRepository {
  late List<AnnouncementModel> educations;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<AnnouncementModel>> getAnnouncements() async {
    List<AnnouncementModel> userAnnouncements = [];

    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firebaseFirestore
          .collection('users')
          .doc(firebaseAuthInstance.currentUser!.uid)
          .get();

      List<Map<String, dynamic>> userAnnouncementList =
          List<Map<String, dynamic>>.from(
              userDoc.data()![Collections.ANNOUNCEMENTS] ?? []);

      for (var announcementData in userAnnouncementList) {
        DocumentSnapshot<Map<String, dynamic>> announcementDoc =
            await _firebaseFirestore
                .collection(Collections.ANNOUNCEMENTS)
                .doc(announcementData['id'])
                .get();
        AnnouncementModel announcement =
            AnnouncementModel.fromFirestore(announcementDoc);
        userAnnouncements.add(announcement);
      }
    } catch (e) {
      print('Hata: $e');
      throw Exception('Failed to get announcements: $e');
    }

    return userAnnouncements;
  }
}
