// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/pages/sign_in_page.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exams_widget.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/header_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/tabbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.userAnnouncementList,
      required this.lessonList});
  final List<String> userAnnouncementList;
  final List<String> lessonList;

  @override
  Widget build(BuildContext context) {
    final String userId;
    final userState = context.watch<AuthBloc>().state;

    if (userState is Authenticated) {
      userId = userState.userId!;
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
              print("UserInitialState : HomePage");
              context.read<UserBloc>().add(UserFetchEvent(userId: userId));
              return const CircularProgressIndicator();
            } else if (state is UserFetchLoadingState) {
              print("UserFetchLoadingState : HomePage");
              return const Center(child: CustomCircularProgress());
            } else if (state is UserFetchErrorState) {
              print("UserFetchErrorState : HomePage");
              return Text(state.errorMessage);
            } else if (state is UserDeletedState) {
              print("UserDeletedState : HomePage");
              return const SignInPage();
            } else if (state is UserFetchedState) {
              print("UserFetchedState : HomePage");
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HeaderWidget(name: state.user!.nameSurname),
                    TabBarWidget(
                        // TODO: Duyurular kısmında card da boyutlandırma hatası var.
                        userAnnouncementList: userAnnouncementList,
                        lessonList: lessonList),
                    const ExamsWidget(),
                    // TODO : Sınav cardı düzeltilecek
                    // TODO : Dialog ekranı düzeltilecek
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
