import 'package:cloud_firestore/cloud_firestore.dart';

class DiscussionModel {
  final String id;
  final String title;
  final String startTime;

  DiscussionModel(
      {required this.id, required this.title, required this.startTime});

  factory DiscussionModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiscussionModel(
      id: doc.id,
      title: data['title'] ?? '',
      startTime: data['startTime'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'startTime': startTime,
    };
  }
}
