import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/collection_names.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/utils/firebase_firestore_exception.dart';

class LessonRepository {
  late List<Education> educations, userLessons;
  late List<Education> filteredByTeacherEducations;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Education>> getLessonsByCategory() async {
    //Kategorisi katalog olanları listele
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(Collections.FETCH_CATEGORY, isEqualTo: "Katalog")
          .orderBy(FieldPath.documentId,
              descending: true) //ilk eklenen verinin en üstte gözükmesi için
          .get();
      educations = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();
      return educations;
    } catch (error) {
      String errorMessage = FirestoreExceptionHelper.handleException(error);
      throw Exception(errorMessage);
    }
  }

  Future<List<Education>> filterLessonsByTeacher(String teacher) async {
    //Kategorisi katalog olan dersleri öğretmene göre filtrele
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(Collections.FETCH_CATEGORY, isEqualTo: "Katalog")
          .where(Collections.TEACHER, isEqualTo: teacher)
          .orderBy(FieldPath.documentId,
              descending: true) //ilk eklenen verinin en üstte gözükmesi için
          .get();
      filteredByTeacherEducations = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();

      return filteredByTeacherEducations;
    } catch (error) {
      String errorMessage = FirestoreExceptionHelper.handleException(error);
      throw Exception(errorMessage);
    }
  }

  Future<List<Education>> getLessons(List<String> userLessonList) async {
    //öğrenciye atanmış olan derslerin id sine göre listele
    try {
      if (userLessonList.isEmpty) {
        return []; // Boş liste olduğunda exception kısmına düşmemesi için
      }
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.EDUCATION)
          .where(FieldPath.documentId, whereIn: userLessonList)
          .get();
      userLessons = querySnapshot.docs.map((doc) {
        return Education.fromFirestore(doc);
      }).toList();
      return userLessons;
    } catch (error) {
      String errorMessage = FirestoreExceptionHelper.handleException(error);
      throw Exception(errorMessage);
    }
  }
}
