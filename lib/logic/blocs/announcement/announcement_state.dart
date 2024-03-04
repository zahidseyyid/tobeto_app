import 'package:tobeto_app/models/announcements_model.dart';

abstract class AnnouncementState {}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoading extends AnnouncementState {}

class AnnouncementLoaded extends AnnouncementState {
  final List<AnnouncementModel> announcementList;

  AnnouncementLoaded({required this.announcementList});
}

class AnnouncementError extends AnnouncementState {
  final String errorMessage;

  AnnouncementError({required this.errorMessage});
}
