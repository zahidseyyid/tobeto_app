// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_event.dart';
import 'package:flutter_application_1/logic/blocs/auth/auth_state.dart';
import 'package:flutter_application_1/logic/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user/user_state.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circle_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    var logoAsset = getLogo(brightness);
    UserProfile? userProfile;
    final userState = context.watch<UserBloc>().state;
    if (userState is UserInitialState) {
    } else if (userState is UserFetchedState) {
      userProfile = userState.user!;
    }
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          print("AuthError : MyDrawer");
          ToastHelper.showErrorToast(state.errorMessage);
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
          print("Authenticated : MyDrawer");
        } else if (state is Unauthenticated) {
          print("Unauthenticated : MyDrawer");
          Navigator.pushReplacementNamed(context, "/sign_in");
        }
      },
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    logoAsset, // Replace with your logo image path
                    width: 200,
                    height: 200,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    child: const Text(DrawerConstants.homePage),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/profile");
                    },
                    child: const Text(DrawerConstants.profilePage),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/catalog");
                    },
                    child: const Text(DrawerConstants.catalogPage),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/calendar");
                    },
                    child: const Text(DrawerConstants.calendarPage),
                  ),
                ],
              ),
            ),
            const Divider(),
            Column(
              children: [
                ListTile(
                  contentPadding: paddingHBig,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 0,
                        child: (userProfile == null ||
                                userProfile.profilePictureUrl == null)
                            ? const Icon(Icons.person)
                            : CustomCircleAvatar(
                                radius: 20,
                                pickedImage: File(""),
                                userPhotoUrl:
                                    userProfile.profilePictureUrl ?? ""),
                      ),
                      //SizedBox(width: deviceWidth / 20),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              (userProfile == null)
                                  ? DrawerConstants.error
                                  : userProfile.nameSurname,
                              maxLines: 1,
                            ),
                          )),
                      // SizedBox(width: deviceWidth / 16),
                      Expanded(
                        flex: 0,
                        child: GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            },
                            child: ProfileEditPageConstants.exitToAppIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(DrawerConstants.tobetoCopyright),
            ),
          ],
        ),
      ),
    );
  }
}
