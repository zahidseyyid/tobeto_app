import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/profile_page/about_me.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:flutter_application_1/widgets/profile_page/profile_information.dart';
import 'package:flutter_application_1/widgets/profile_page/social_media.dart';
import 'package:flutter_application_1/widgets/profile_page/work_experience.dart';

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
                              "Bu özellik şu anda kullanılamıyor")
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
