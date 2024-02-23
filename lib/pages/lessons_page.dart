import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/dropdown_sort.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/edu_banner.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/edu_tabbar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/search_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return ChangeNotifierProvider<StateData>(
      //Arama ve filtreleme işlemleri için ChangeNotifierProvider ile sarmalladım
      create: (context) => StateData(),
      child: Scaffold(
        appBar: CustomAppBarWidget(brightness: brightness),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const EduBannerWidget(title: LessonConstants.lessons),
              const SearchWidget(hintText: LessonConstants.search),
              DropdownSortWidget(
                hint: LessonConstants.corporationChoose,
                dropdownItems: LessonConstants.dropdownCorporationItems,
              ),
              DropdownSortWidget(
                dropdownValue: LessonConstants.dropdownSortItems.first,
                dropdownItems: LessonConstants.dropdownSortItems,
              ),
              const EduTabbarWidget(),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
