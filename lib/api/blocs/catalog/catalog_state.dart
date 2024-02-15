import 'package:flutter_application_1/models/education_model.dart';

abstract class CatalogLessonState {}

class CatalogLessonInitial extends CatalogLessonState {}

class CatalogLessonLoading extends CatalogLessonState {}

class CatalogLessonLoaded extends CatalogLessonState {
  final List<Education> catalogLessonList;

  CatalogLessonLoaded({required this.catalogLessonList});
}

class CatalogLessonError extends CatalogLessonState {
  final String errorMessage;

  CatalogLessonError({required this.errorMessage});
}
