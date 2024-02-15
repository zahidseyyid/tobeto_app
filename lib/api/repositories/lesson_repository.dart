import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/collection_names.dart';
import 'package:flutter_application_1/models/education_model.dart';

class LessonRepository {
  late List<Education> educations, userLessons;
  late List<Education> filteredByTeacherEducations;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Education>> getLessonsByCategory() async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(Collections.FETCH_CATEGORY, isEqualTo: "Katalog")
          .orderBy(FieldPath.documentId,
              descending: true) //ilk eklediğim verinin en üstte gözükmesi için
          .get();
      educations = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();
      return educations;
    } catch (error) {
      throw Exception('Failed to get lessons: $error');
    }
  }

  Future<List<Education>> filterLessonsByTeacher(String teacher) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(Collections.FETCH_CATEGORY, isEqualTo: "Katalog")
          .where(Collections.TEACHER, isEqualTo: teacher)
          .orderBy(FieldPath.documentId,
              descending: true) //ilk eklediğim verinin en üstte gözükmesi için
          .get();
      filteredByTeacherEducations = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();

      return filteredByTeacherEducations;
    } catch (error) {
      throw Exception('Failed to get lessons: $error');
    }
  }

  Future<List<Education>> getLessons(List<String> userLessonList) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(FieldPath.documentId, whereIn: userLessonList)
          .get();
      userLessons = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();
      return userLessons;
    } catch (error) {
      throw Exception('Failed to get lessons: $error');
    }
  }
}
