import 'package:flutter_application_1/api/blocs/lesson_bloc/lesson_event.dart';
import 'package:flutter_application_1/api/blocs/lesson_bloc/lesson_state.dart';
import 'package:flutter_application_1/api/repositories/lesson_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository lessonRepository;
  LessonBloc({required this.lessonRepository}) : super(LessonInitial()) {
    on<FetchCategoryLessons>(_onFetchCategoryLessons);
    on<FilterCategoryLessons>(_onFilterCatalogLesson);
  }
  void _onFetchCategoryLessons(
      FetchCategoryLessons event, Emitter<LessonState> emit) async {
    emit(LessonLoading());
    try {
      final lessonList = await lessonRepository.getLessonsByCategory("Katalog");
      emit(LessonLoaded(educationList: lessonList));
    } catch (e) {
      emit(LessonError());
    }
  }

  void _onFilterCatalogLesson(
      FilterCategoryLessons event, Emitter<LessonState> emit) async {
    emit(LessonLoading());
    final filteredList =
        await lessonRepository.filterLessonsByTeacher(event.teacher);
    emit(LessonLoaded(educationList: filteredList));
  }
}
