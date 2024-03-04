import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_card.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circle_avatar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_profile_sizedbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInformationWidget extends StatefulWidget {
  const ProfileInformationWidget({super.key});

  @override
  State<ProfileInformationWidget> createState() =>
      _ProfileInformationWidgetState();
}

class _ProfileInformationWidgetState extends State<ProfileInformationWidget> {
  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
    }
    if (userProfile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    MediaQueryData queryData = MediaQuery.of(context);
    double deviceWidth = queryData.size.width;
    return SizedBox(
      child: CustomCardWidget(
        //height: deviceHeight / 2.4,
        width: deviceWidth / 1.1,
        child: Column(
          children: [
            Container(
              width: deviceWidth / 1.1,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: paddingMedium,
                    child: userProfile.profilePictureUrl == null
                        ? const Text(ProfileInformationConstants.emptyPhoto)
                        : CustomCircleAvatar(
                            radius: 80,
                            userPhotoUrl: userProfile.profilePictureUrl!,
                            pickedImage: File(""),
                          ),
                  ),
                ],
              ),
            ),
            Padding(padding: paddingMedium),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: ProfileInformationConstants.personIcon,
              title: ProfileInformationConstants.nameSurname,
              infoText: userProfile.nameSurname,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: ProfileInformationConstants.calendarIcon,
              title: ProfileInformationConstants.birthDate,
              infoText: userProfile.birthDate ?? "",
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: ProfileInformationConstants.emailIcon,
              title: ProfileInformationConstants.email,
              infoText: userProfile.email,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.phone_outlined,
              title: ProfileInformationConstants.phone,
              infoText: userProfile.phone ?? "",
            ),
            Padding(padding: paddingMedium),
          ],
        ),
      ),
    );
  }
}
