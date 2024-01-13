import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
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
        // Değişiklik burada
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton.outlined(
                          onPressed: () => {}, icon: const Icon(Icons.edit)),
                      IconButton.outlined(
                        onPressed: () => {},
                        icon: const Icon(Icons.share_outlined),
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
