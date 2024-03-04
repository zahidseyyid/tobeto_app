import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/drawer.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_app_bar.dart';
import 'package:tobeto_app/widgets/profile_page/about_me.dart';
import 'package:tobeto_app/widgets/profile_page/education.dart';
import 'package:tobeto_app/widgets/profile_page/profile_information.dart';
import 'package:tobeto_app/widgets/profile_page/social_media.dart';
import 'package:tobeto_app/widgets/profile_page/work_experience.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingMedium,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: paddingHBig,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton.outlined(
                          onPressed: () =>
                              {Navigator.pushNamed(context, "/profile_edit")},
                          icon: ProfilePageConstants.editIcon),
                      IconButton.outlined(
                        onPressed: () => {
                          ToastHelper.showErrorToast(
                              ProfileEditConstants.featureUnavailable)
                        },
                        icon: ProfilePageConstants.shareIcon,
                      ),
                    ],
                  ),
                ),
                const ProfileInformationWidget(),
                Padding(padding: paddingMedium),
                const AboutMeWidget(),
                Padding(padding: paddingMedium),
                const EducationWidget(),
                Padding(padding: paddingMedium),
                const WorkExperienceWidget(),
                Padding(padding: paddingMedium),
                const SocialMediaWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
