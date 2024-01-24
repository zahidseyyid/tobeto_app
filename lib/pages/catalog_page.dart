import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/catalog_page/catalog_banner.dart';
import 'package:flutter_application_1/widgets/catalog_page/catalog_lessons_item.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<StateData>(
      create: (context) => StateData(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(getLogo(brightness), width: 125),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
            ),
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CatalogBanner(),
              Padding(padding: paddingMedium),
              CustomButton(
                  onPressed: () {},
                  buttonText: "Filtrele",
                  buttonColor: const Color(0xFF9933FF),
                  width: deviceWidth * .85,
                  height: deviceHeight / 22,
                  buttonTextColor: Theme.of(context).colorScheme.background),
              const CatalogLessonsItem(),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
