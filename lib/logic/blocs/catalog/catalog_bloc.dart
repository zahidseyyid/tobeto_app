import 'package:flutter_application_1/logic/blocs/catalog/catalog_event.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_state.dart';
import 'package:flutter_application_1/logic/repositories/lesson_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogLessonBloc extends Bloc<CatalogLessonEvent, CatalogLessonState> {
  final LessonRepository _lessonRepository;
  CatalogLessonBloc(this._lessonRepository) : super(CatalogLessonInitial()) {
    on<FetchCategoryLessons>(_onFetchCategoryLessons);
    on<FilterCategoryLessons>(_onFilterCatalogLesson);
    on<ResetFetchLessons>(_onReset);
  }
  void _onFetchCategoryLessons(
      FetchCategoryLessons event, Emitter<CatalogLessonState> emit) async {
    emit(CatalogLessonLoading());
    try {
      final lessonList = await _lessonRepository.getLessonsByCategory();
      emit(CatalogLessonLoaded(catalogLessonList: lessonList));
    } catch (e) {
      emit(CatalogLessonError(errorMessage: e.toString()));
    }
  }

  void _onFilterCatalogLesson(
      FilterCategoryLessons event, Emitter<CatalogLessonState> emit) async {
    emit(CatalogLessonLoading());
    try {
      final filteredList =
          await _lessonRepository.filterLessonsByTeacher(event.teacher);
      emit(CatalogLessonLoaded(catalogLessonList: filteredList));
    } catch (e) {
      emit(CatalogLessonError(errorMessage: e.toString()));
    }
  }

  void _onReset(
      ResetFetchLessons event, Emitter<CatalogLessonState> emit) async {
    emit(CatalogLessonInitial());
  }
}
