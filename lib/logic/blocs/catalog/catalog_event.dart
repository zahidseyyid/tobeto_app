abstract class CatalogLessonEvent {}

class FetchCategoryLessons extends CatalogLessonEvent {}

class FilterCategoryLessons extends CatalogLessonEvent {
  final String teacher;

  FilterCategoryLessons({required this.teacher});
}

class ResetFetchLessons extends CatalogLessonEvent {}
