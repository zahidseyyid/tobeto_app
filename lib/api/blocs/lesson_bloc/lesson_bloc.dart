import 'package:flutter_application_1/api/blocs/lesson_bloc/lesson_event.dart';
import 'package:flutter_application_1/api/blocs/lesson_bloc/lesson_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonInitial());
}
