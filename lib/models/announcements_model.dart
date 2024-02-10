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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'text': text});
    result.addAll({'isAnnouncement': isAnnouncement});
    result.addAll({'isRead': isRead});
    result.addAll({'date': date.millisecondsSinceEpoch});

    return result;
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      isAnnouncement: map['isAnnouncement'] ?? false,
      isRead: map['isRead'] ?? false,
      date: (map['date'] as Timestamp).toDate(),
    );
  }

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
