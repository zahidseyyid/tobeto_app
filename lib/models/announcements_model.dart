class AnnouncementModel {
  final String id;
  final String title;
  final String text;
  final bool isAnnouncement;
  final DateTime date;

  AnnouncementModel(
      {required this.id,
      required this.title,
      required this.text,
      required this.isAnnouncement,
      required this.date});
}
