import 'package:tobeto_app/logic/blocs/catalog/catalog_event.dart';
import 'package:tobeto_app/logic/blocs/catalog/catalog_state.dart';
import 'package:tobeto_app/logic/repositories/lesson_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogLessonBloc extends Bloc<CatalogLessonEvent, CatalogLessonState> {
  final LessonRepository _lessonRepository;
  CatalogLessonBloc(this._lessonRepository) : super(CatalogLessonInitial()) {
    on<FetchCategoryLessons>(_onFetchCategoryLessons);
    on<FilterCategoryLessons>(_onFilterCatalogLesson);
    on<ResetFetchLessons>(_onReset);
  }
  // Kategorisi katalog olan dersleri getir
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

// Katalog derslerini öğretmene göre filtrele
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

// Filtrelendikten sonra stateti initial durumuna getirip katalog derslerinin tamamını listelemek için
  void _onReset(
      ResetFetchLessons event, Emitter<CatalogLessonState> emit) async {
    emit(CatalogLessonInitial());
  }
}
