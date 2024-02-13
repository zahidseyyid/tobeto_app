import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_event.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/api/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/repositories/announcement_repository.dart';
import 'package:flutter_application_1/api/repositories/auth_repository.dart';
import 'package:flutter_application_1/api/repositories/lesson_repository.dart';
import 'package:flutter_application_1/api/repositories/user_repository.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/sign_up_page.dart';
import 'package:flutter_application_1/pages/splash_page.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final lessonRepo = LessonRepository();
  final announcementRepository = AnnouncementRepository();
  final authRepository = AuthRepository();
  final userRepository = UserRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LessonBloc>(
        create: (context) => LessonBloc(lessonRepository: lessonRepo),
      ),
      BlocProvider<AnnouncementBloc>(
        create: (context) =>
            AnnouncementBloc(announcementRepository: announcementRepository),
      ),
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepository, userRepository),
      ),
      BlocProvider(
        create: (context) => UserBloc(userRepository),
      ),
    ],
    child: const MyApp(),
  ));
}

final firebaseAuthInstance = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tobeto',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthAppStarted());
          return Container();
        } else if (state is AuthLoading) {
          return const SplashPage();
        } else if (state is AuthError) {
          return const SignUpPage();
        } else if (state is Unauthenticated) {
          return const SignUpPage();
        } else if (state is Authenticated) {
          return const HomePage();
        } else {
          return Container();
        }
      }),
    );
  }
}
