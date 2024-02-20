import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/icon_tabbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userId;
    final authState = context.watch<AuthBloc>().state;
    if (authState is Authenticated) {
      userId = authState.userId!;
    } else {
      userId = "";
    }
    final userState = context.watch<UserBloc>().state;
    if (userState is UserFetchedState) {
    } else if (userState is UserFetchLoadingState) {
    } else if (userState is UserFetchErrorState) {
    } else if (userState is UserInitialState) {
      context.read<UserBloc>().add(UserFetchEvent(userId: userId));
    }
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
        appBar: CustomAppBarWidget(
            brightness: brightness,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: IconTabBarWidget(),
        ));
  }
}
