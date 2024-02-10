abstract class LessonEvent {}

class FetchCategoryLessons extends LessonEvent {
  final String fetchCategory;

  FetchCategoryLessons({required this.fetchCategory});
}

class FilterCategoryLessons extends LessonEvent {
  final String teacher;

  FilterCategoryLessons({required this.teacher});
}
