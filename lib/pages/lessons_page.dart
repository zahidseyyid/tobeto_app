import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
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
    List<String> dropdownSortItems = [
      "Adına göre (A-Z)",
      "Adına göre (Z-A)",
      "Tarihe göre (Y-E)",
      "Tarihe göre (E-Y)"
    ];
    List<String> dropdownCorporationItems = [
      "İstanbul Kodluyor",
    ];
    return ChangeNotifierProvider<StateData>(
      //Arama ve filtreleme işlemleri için ChangeNotifierProvider ile sarmalladım
      create: (context) => StateData(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(getLogo(brightness), width: 125),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const EduBannerWidget(title: "Eğitimlerim"),
              const SearchWidget(hintText: "Arama"),
              DropdownSortWidget(
                hint: "Kurum Seçiniz..",
                dropdownItems: dropdownCorporationItems,
              ),
              DropdownSortWidget(
                dropdownValue: dropdownSortItems.first,
                dropdownItems: dropdownSortItems,
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
