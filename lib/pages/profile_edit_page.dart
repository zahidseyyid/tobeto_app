import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_event.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_app_bar.dart';
import 'package:tobeto_app/widgets/profile_edit_page/icon_tabbar.dart';
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
        ),
        body: Padding(
          padding: paddingMedium,
          child: const IconTabBarWidget(),
        ));
  }
}
