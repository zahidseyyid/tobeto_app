// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/lesson_item_widget.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';

class EduTabbarWidget extends StatelessWidget {
  const EduTabbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(
                text: LessonConstants.allLessons,
              ),
              Tab(
                text: LessonConstants.continuingLessons,
              ),
              Tab(
                text: LessonConstants.completedLessons,
              ),
            ],
          ),
          //const yapma
          AutoScaleTabBarView(
            children: <Widget>[
              LessonItemWidget(),
              LessonItemWidget(),
              LessonItemWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
