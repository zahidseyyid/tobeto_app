import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile_page/education_edit.dart';
import 'package:flutter_application_1/widgets/profile_page/experience_edit.dart';
import 'package:flutter_application_1/widgets/profile_page/profile_edit.dart';
import 'package:flutter_application_1/widgets/profile_page/settings_edit.dart';
import 'package:flutter_application_1/widgets/profile_page/social_media_edit.dart';

class IconTapBarWidget extends StatefulWidget {
  const IconTapBarWidget({Key? key}) : super(key: key);

  @override
  State<IconTapBarWidget> createState() => _IconTapBarWidgetState();
}

class _IconTapBarWidgetState extends State<IconTapBarWidget>
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
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(icon: Icon(Icons.work_outline_outlined), text: 'Profil'),
            Tab(icon: Icon(Icons.card_travel_outlined), text: 'Deneyim'),
            Tab(icon: Icon(Icons.menu_book_outlined), text: 'Eğitim'),
            Tab(icon: Icon(Icons.facebook_outlined), text: 'Sosyal Medya'),
            Tab(icon: Icon(Icons.settings_outlined), text: 'Ayarlar'),
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
