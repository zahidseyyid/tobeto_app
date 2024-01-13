import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/dropdown_sort.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/edu_banner.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/search_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  List<String> dropdownSortItems = [
    "Haber",
    "Duyuru",
  ];
  List<String> dropdownCorporationItems = [
    "İstanbul Kodluyor",
  ];
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
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
              const EduBannerWidget(title: "Duyurularım"),
              const SearchWidget(hintText: "Arama"),
              DropdownSortWidget(
                dropdownValue: dropdownSortItems.first,
                dropdownItems: dropdownSortItems,
              ),
              DropdownSortWidget(
                dropdownValue: dropdownCorporationItems.first,
                dropdownItems: dropdownCorporationItems,
              ),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
