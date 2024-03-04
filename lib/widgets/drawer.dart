import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_bloc.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_event.dart';
import 'package:tobeto_app/logic/blocs/auth/auth_state.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circle_avatar.dart';
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
          ToastHelper.showErrorToast(state.errorMessage);
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {
        } else if (state is Unauthenticated) {
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
                    icon: LessonConstants.closeIcon,
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
                      Navigator.pushReplacementNamed(context, "/evoluation");
                    },
                    child: const Text(DrawerConstants.evaluationPage),
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
                      Navigator.pushReplacementNamed(context, "/calendar",
                          arguments: userProfile!.userLessons!);
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
                            ? SignUpPageConstants.personIcon
                            : CustomCircleAvatar(
                                radius: 20,
                                pickedImage: File(""),
                                userPhotoUrl:
                                    userProfile.profilePictureUrl ?? ""),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: paddingHMedium,
                            child: Text(
                              (userProfile == null)
                                  ? DrawerConstants.error
                                  : userProfile.nameSurname,
                              maxLines: 1,
                            ),
                          )),
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
            Padding(
              padding: paddingAllMedium,
              child: const Text(DrawerConstants.tobetoCopyright),
            ),
          ],
        ),
      ),
    );
  }
}
