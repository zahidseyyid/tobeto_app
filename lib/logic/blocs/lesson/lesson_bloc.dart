import 'package:flutter_application_1/logic/blocs/lesson/lesson_event.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_state.dart';
import 'package:flutter_application_1/logic/repositories/lesson_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository _lessonRepository;
  LessonBloc(this._lessonRepository) : super(LessonInitial()) {
    on<FetchUserLessons>(_onFetchUserLessons);
    on<ResetFetchLessons>(_onReset);
  }
// Kullanıcı derslerini listele
  void _onFetchUserLessons(
      FetchUserLessons event, Emitter<LessonState> emit) async {
    emit(LessonLoading());
    try {
      final userLessonList =
          await _lessonRepository.getLessons(event.userLessonList);
      emit(LessonLoaded(educationList: userLessonList));
    } catch (e) {
      emit(LessonError(errorMessage: e.toString()));
    }
  }

// State'i resetle yani initial değerine getir
  void _onReset(ResetFetchLessons event, Emitter<LessonState> emit) async {
    emit(LessonInitial());
  }
}
