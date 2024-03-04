import 'package:flutter/material.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/pages/announcements_page.dart';
import 'package:tobeto_app/pages/calendar_page.dart';
import 'package:tobeto_app/pages/catalog_page.dart';
import 'package:tobeto_app/pages/discussion_list_page.dart';
import 'package:tobeto_app/pages/evaluation_page.dart';
import 'package:tobeto_app/pages/lessons_page.dart';
import 'package:tobeto_app/pages/page_404.dart';
import 'package:tobeto_app/pages/profile.dart';
import 'package:tobeto_app/pages/profile_edit_page.dart';
import 'package:tobeto_app/pages/splash_page.dart';

import '../../constants/route_constants.dart';
import '../../pages/chat_bot_message_page.dart';
import '../../pages/exam_page.dart';
import '../../pages/home_page.dart';
import '../../pages/lesson_details_page.dart';
import '../../pages/sign_in_page.dart';
import '../../pages/sign_up_page.dart';
import '../../pages/auth_control_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case annonuncementRoute:
        return MaterialPageRoute(builder: (_) => const AnnouncementsPage());
      case authControlRoute:
        return MaterialPageRoute(builder: (_) => const AuthControlPage());
      case catalogRoute:
        return MaterialPageRoute(builder: (_) => const CatalogPage());
      case calendarRoute:
        return MaterialPageRoute(
            builder: (_) => CalendarPage(
                  lessonList: args as List<String>,
                ));
      case chatBotRoute:
        if (args is Map<String, dynamic>?) {
          final String uid = args!['uid'] as String;
          if (args['discussionId'] == null) {
            return MaterialPageRoute(
              builder: (_) => ChatBotMessagePage(
                uid: uid,
              ),
            );
          }
          final String discussionId = args['discussionId'] as String;
          return MaterialPageRoute(
            builder: (_) => ChatBotMessagePage(
              uid: uid,
              discussionId: discussionId,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const Page404());
      case discussionListRoute:
        return MaterialPageRoute(
            builder: (_) => DiscussionListPage(
                  uid: args as String,
                ));
      case evoluationRoute:
        return MaterialPageRoute(builder: (_) => const EvaluationPage());
      case examRoute:
        return MaterialPageRoute(
            builder: (_) => ExamPage(
                  category: args as String,
                ));
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case lessonRoute:
        return MaterialPageRoute(builder: (_) => const LessonsPage());
      case lessonDetailRoute:
        return MaterialPageRoute(
            builder: (_) => LessonDetailPage(
                  education: args as Education,
                ));
      case profileEditRoute:
        return MaterialPageRoute(builder: (_) => const ProfileEditPage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Page404(),
        );
    }
  }
}
