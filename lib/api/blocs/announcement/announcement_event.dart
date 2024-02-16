abstract class AnnouncementEvent {}

class FetchAnnouncements extends AnnouncementEvent {
  final List<Map<String, dynamic>> userAnnouncementList;

  FetchAnnouncements({required this.userAnnouncementList});
}

class UpdateAnnouncement extends AnnouncementEvent {
  final String id;

  UpdateAnnouncement({required this.id});
}
