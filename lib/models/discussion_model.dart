import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DiscussionModel {
  final String id;
  final String title;
  final String startTime;

  DiscussionModel(
      {required this.id, required this.title, required this.startTime});

  factory DiscussionModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Timestamp timestamp = data['startTime'];
    String formattedDate = DateFormat('dd-MM-yyyy').format(timestamp.toDate());
    return DiscussionModel(
      id: doc.id,
      title: data['firstMessage'] ?? '',
      startTime: formattedDate,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'startTime': startTime,
    };
  }
}
