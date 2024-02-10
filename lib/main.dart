import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/api/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/api/repositories/announcement_repository.dart';
import 'package:flutter_application_1/api/repositories/lesson_repository.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final lessonRepo = LessonRepository();
  final announcementRepository = AnnouncementRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LessonBloc>(
        create: (context) => LessonBloc(lessonRepository: lessonRepo),
      ),
      BlocProvider<AnnouncementBloc>(
        create: (context) =>
            AnnouncementBloc(announcementRepository: announcementRepository),
      )
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
      home: FutureBuilder(
        // Kullanıcının giriş yapılıp yapmadığını kontrol et
        future: firebaseAuthInstance.authStateChanges().first,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Eğer giriş durumu kontrol ediliyorsa, bekleme durumunu göster
            return const CircularProgressIndicator();
          } else {
            // Eğer giriş kontrolü tamamlandıysa, kullanıcının durumuna göre sayfa belirle
            if (snapshot.hasData) {
              // Kullanıcı giriş yapmışsa
              return const HomePage();
            } else {
              // Kullanıcı giriş yapmamışsa
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
