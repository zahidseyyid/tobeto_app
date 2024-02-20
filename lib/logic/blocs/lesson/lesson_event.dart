abstract class LessonEvent {}

class FetchUserLessons extends LessonEvent {
  final List<String> userLessonList;

  FetchUserLessons({required this.userLessonList});
}

class ResetFetchLessons extends LessonEvent {}
