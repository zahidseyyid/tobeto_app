import 'package:tobeto_app/models/education_model.dart';

abstract class LessonState {}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  final List<Education> educationList;

  LessonLoaded({required this.educationList});
}

class LessonError extends LessonState {
  final String errorMessage;

  LessonError({required this.errorMessage});
}
