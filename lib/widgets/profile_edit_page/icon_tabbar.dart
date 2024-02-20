import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/education_edit.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/experience_edit.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/profile_edit.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/settings_edit.dart';
import 'package:flutter_application_1/widgets/profile_edit_page/social_media_edit.dart';

class IconTabBarWidget extends StatefulWidget {
  const IconTabBarWidget({Key? key}) : super(key: key);

  @override
  State<IconTabBarWidget> createState() => _IconTabBarWidgetState();
}

class _IconTabBarWidgetState extends State<IconTabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorSize: TabBarIndicatorSize.values[0],
          indicatorColor: Theme.of(context).colorScheme.secondary,
          labelColor: Theme.of(context).colorScheme.primary,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(
                icon: ProfileEditPageConstants.workIcon,
                text: ProfileEditPageConstants.profile),
            Tab(
                icon: ProfileEditPageConstants.cardTravelIcon,
                text: ProfileEditPageConstants.experience),
            Tab(
                icon: ProfileEditPageConstants.menuBookIcon,
                text: ProfileEditPageConstants.education),
            Tab(
                icon: ProfileEditPageConstants.facebookIcon,
                text: ProfileEditPageConstants.socialMedia),
            Tab(
                icon: ProfileEditPageConstants.settingsIcon,
                text: ProfileEditPageConstants.settings),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ProfileEdit(),
              ExperienceEdit(),
              EducationEdit(),
              SocialMediaEdit(),
              SettingsEdit(),
            ],
          ),
        ),
      ],
    );
  }
}
