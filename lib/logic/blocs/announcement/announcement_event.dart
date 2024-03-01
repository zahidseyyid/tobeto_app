abstract class AnnouncementEvent {}

class FetchAnnouncements extends AnnouncementEvent {
  final List<String> userAnnouncementList;

  FetchAnnouncements({required this.userAnnouncementList});
}

class AnnouncementReset extends AnnouncementEvent {}
