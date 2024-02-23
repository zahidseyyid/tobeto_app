import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final String id;
  final String title;
  final String text;
  final bool isAnnouncement;
  bool isRead;
  final DateTime date;

  AnnouncementModel(
      {required this.id,
      required this.title,
      required this.text,
      required this.isAnnouncement,
      required this.isRead,
      required this.date});

  factory AnnouncementModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return AnnouncementModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      isAnnouncement: map['isAnnouncement'] ?? false,
      isRead: map['isRead'] ?? false,
      date: (map['date'] as Timestamp).toDate(),
    );
  }
}
