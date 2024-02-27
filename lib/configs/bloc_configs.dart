import 'package:flutter_application_1/logic/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_bloc.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_bloc.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/logic/repositories/announcement_repository.dart';
import 'package:flutter_application_1/logic/repositories/auth_repository.dart';
import 'package:flutter_application_1/logic/repositories/chat_bot_repository.dart';
import 'package:flutter_application_1/logic/repositories/lesson_repository.dart';
import 'package:flutter_application_1/logic/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _authRepository = AuthRepository();
final _userRepository = UserRepository();
final _lessonRepository = LessonRepository();
final _announcementRepository = AnnouncementRepository();
final _chatRepository = ChatRepository();

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

final chatBlocProvider = BlocProvider<ChatBloc>(
  create: (context) => ChatBloc(_chatRepository),
);

final discussionBlocProvider = BlocProvider(
  create: (context) => DiscussionBloc(_chatRepository),
);
