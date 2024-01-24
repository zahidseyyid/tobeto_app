class LessonModel {
  final String id;
  final String img;
  final String title;
  final DateTime? date;
  final String? teacher;
  final String? lessonDuration;

  LessonModel(
      {required this.id,
      required this.img,
      required this.title,
      this.date,
      this.teacher,
      this.lessonDuration});
}
