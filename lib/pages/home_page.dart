import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/pages/sign_in_page.dart';
import 'package:tobeto_app/widgets/home_page/gradientcard_widget.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circular_progress.dart';
import 'package:tobeto_app/widgets/drawer.dart';
import 'package:tobeto_app/widgets/home_page/exam_widgets/exams_widget.dart';
import 'package:tobeto_app/widgets/home_page/footer.dart';
import 'package:tobeto_app/widgets/home_page/header_widget.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_app_bar.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/tabbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String userId;
    UserProfile user;
    final authState = context.watch<AuthBloc>().state;
    if (authState is Authenticated) {
      userId = authState.userId!;
    } else {
      return const SignInPage();
    }
    Brightness brightness = Theme.of(context).brightness;
    return ChangeNotifierProvider<StateData>(
      //Bildirim güncellenmesi için ChangeNotifierProvider ile sarmalladım
      create: (context) => StateData(),
      child: Scaffold(
        appBar: CustomAppBarWidget(brightness: brightness),
        drawer: const MyDrawer(),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitialState) {
              context.read<UserBloc>().add(UserFetchEvent(userId: userId));
              return const CircularProgressIndicator();
            } else if (state is UserFetchLoadingState) {
              return const Center(child: CustomCircularProgress());
            } else if (state is UserFetchErrorState) {
              return Text(state.errorMessage);
            } else if (state is UserDeletedState) {
              return const SignInPage();
            } else if (state is UserFetchedState) {
              user = state.user!;

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HeaderWidget(name: state.user!.nameSurname),
                    TabBarWidget(
                        userAnnouncementList: user.userAnnouncements!,
                        lessonList: user.userLessons!),
                    const ExamsWidget(),
                    // TODO: Renkler temadan alınacak
                    GradientCardWidget(
                      title: HomePageConstants.createProfile,
                      startColor: const Color(0xFFbda6fe),
                      endColor: const Color(0xFF1d0b8c),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/profile");
                      },
                      includeStartButton: true,
                    ),
                    GradientCardWidget(
                      title: HomePageConstants.evaluateYourself,
                      startColor: const Color(0xFF5eb6ca),
                      endColor: const Color(0xFF0e0b93),
                      includeStartButton: true,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/evoluation");
                      },
                    ),
                    GradientCardWidget(
                      title: HomePageConstants.startLearning,
                      startColor: const Color(0xFFe3a6fe),
                      endColor: const Color(0xFF3c0b8c),
                      includeStartButton: true,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/catalog");
                      },
                    ),

                    const FooterWidget(),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
