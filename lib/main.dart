import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/bloc_configs.dart';
import 'package:flutter_application_1/configs/routes/route.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/auth_control_page.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //TODO: Theme ve colorlar düzenlenecek
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      authBlocProvider,
      userBlocProvider,
      lessonBlocProvider,
      catalogLessonBlocProvider,
      announcementBlocProvider,
      chatBlocProvider,
      discussionBlocProvider,
    ],
    child: const TobetoApp(),
  ));
}

class TobetoApp extends StatelessWidget {
  const TobetoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //takvimin turkce olmasi icin
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr', 'TR'), // Turkce olarak ayarla
      title: 'Tobeto',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      home: const AuthControlPage(),
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
