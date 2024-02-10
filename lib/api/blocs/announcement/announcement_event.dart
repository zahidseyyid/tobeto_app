abstract class AnnouncementEvent {}

class FetchAnnouncements extends AnnouncementEvent {}

class UpdateAnnouncement extends AnnouncementEvent {
  final String id;

  UpdateAnnouncement({required this.id});
}
