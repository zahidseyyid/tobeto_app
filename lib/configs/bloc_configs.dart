import 'package:flutter_application_1/api/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/api/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/repositories/announcement_repository.dart';
import 'package:flutter_application_1/api/repositories/auth_repository.dart';
import 'package:flutter_application_1/api/repositories/lesson_repository.dart';
import 'package:flutter_application_1/api/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _authRepository = AuthRepository();
final _userRepository = UserRepository();
final _lessonRepository = LessonRepository();
final _announcementRepository = AnnouncementRepository();

final authBlocProvider = BlocProvider<AuthBloc>(
  create: (context) =>
      AuthBloc(_authRepository, _userRepository, UserBloc(_userRepository)),
);

final userBlocProvider = BlocProvider<UserBloc>(
  create: (context) => UserBloc(_userRepository),
);

final lessonBlocProvider = BlocProvider<LessonBloc>(
  create: (context) => LessonBloc(_lessonRepository),
);

final catalogLessonBlocProvider = BlocProvider(
  create: (context) => CatalogLessonBloc(_lessonRepository),
);

final announcementBlocProvider = BlocProvider<AnnouncementBloc>(
  create: (context) => AnnouncementBloc(_announcementRepository),
);
