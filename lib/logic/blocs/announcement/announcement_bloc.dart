import 'package:tobeto_app/logic/blocs/announcement/announcement_event.dart';
import 'package:tobeto_app/logic/blocs/announcement/announcement_state.dart';
import 'package:tobeto_app/logic/repositories/announcement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementRepository _announcementRepository;
  AnnouncementBloc(this._announcementRepository)
      : super(AnnouncementInitial()) {
    on<FetchAnnouncements>(_onFetchAnnouncements);
    on<AnnouncementReset>(_onAnnouncementReset);
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

  void _onAnnouncementReset(
      AnnouncementReset event, Emitter<AnnouncementState> emit) {
    emit(AnnouncementInitial());
  }
}
