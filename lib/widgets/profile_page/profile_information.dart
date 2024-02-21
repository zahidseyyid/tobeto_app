import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
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
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: userProfile!.profilePictureUrl == null
                        ? const Text("Fotoğraf yükle")
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
              icon: Icons.person_2_outlined,
              title: "Ad Soyad",
              infoText: userProfile.nameSurname,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.calendar_month_outlined,
              title: "Doğum Tarihi",
              infoText: userProfile.birthDate ?? "",
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.email_outlined,
              title: "E-posta Adresi",
              infoText: userProfile.email,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.phone_outlined,
              title: "Telefon Numarası",
              infoText: userProfile.phone ?? "",
            ),
            Padding(padding: paddingMedium),
          ],
        ),
      ),
    );
  }
}
