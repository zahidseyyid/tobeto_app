import 'package:flutter_application_1/api/blocs/announcement/announcement_event.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/api/repositories/announcement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementRepository announcementRepository;
  AnnouncementBloc({required this.announcementRepository})
      : super(AnnouncementInitial()) {
    on<FetchAnnouncements>(_onFetchAnnouncements);
  }

  void _onFetchAnnouncements(
      FetchAnnouncements event, Emitter<AnnouncementState> emit) async {
    emit(AnnouncementLoading());
    try {
      final announcementList = await announcementRepository.getAnnouncements();
      emit(AnnouncementLoaded(announcementList: announcementList));
    } catch (e) {
      emit(AnnouncementError());
    }
  }
}
