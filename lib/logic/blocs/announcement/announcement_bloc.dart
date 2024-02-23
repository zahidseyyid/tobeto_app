import 'package:flutter_application_1/logic/blocs/announcement/announcement_event.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/logic/repositories/announcement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementRepository _announcementRepository;
  AnnouncementBloc(this._announcementRepository)
      : super(AnnouncementInitial()) {
    on<FetchAnnouncements>(_onFetchAnnouncements);
  }

// Kullanıcının duyurularını getir
  void _onFetchAnnouncements(
      FetchAnnouncements event, Emitter<AnnouncementState> emit) async {
    emit(AnnouncementLoading());
    try {
      final announcementList = await _announcementRepository
          .getAnnouncements(event.userAnnouncementList);
      emit(AnnouncementLoaded(announcementList: announcementList));
    } catch (e) {
      emit(AnnouncementError(errorMessage: e.toString()));
    }
  }
}
