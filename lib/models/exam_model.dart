import 'package:cloud_firestore/cloud_firestore.dart';

class ExamModel {
  final String question, category;
  final List<String> options;
  final int correctAnswerIndex;

  const ExamModel({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
    required this.category,
  });

  factory ExamModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return ExamModel(
      question: map['question'] ?? '',
      options: List<String>.from(map['options']),
      correctAnswerIndex: map['correctAnswerIndex']?.toInt() ?? 0,
      category: map['category'] ?? '',
    );
  }
}
