abstract class LessonEvent {}

class FetchCategoryLessons extends LessonEvent {}

class FilterCategoryLessons extends LessonEvent {
  final String teacher;

  FilterCategoryLessons({required this.teacher});
}
