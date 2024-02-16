import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/collection_names.dart';
import 'package:flutter_application_1/models/announcements_model.dart';

class AnnouncementRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<AnnouncementModel>> getAnnouncements(
      List<Map<String, dynamic>> userAnnouncementList) async {
    List<AnnouncementModel> announcements = [];
    try {
      for (var item in userAnnouncementList) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firebaseFirestore
                .collection(Collections.ANNOUNCEMENTS)
                .doc(item['id'])
                .get();

        if (snapshot.exists) {
          AnnouncementModel announcement =
              AnnouncementModel.fromFirestore(snapshot);
          announcements.add(announcement);
        }
      }
      return announcements;
    } catch (e) {
      throw Exception('Failed to get announcements: $e');
    }
  }
}
