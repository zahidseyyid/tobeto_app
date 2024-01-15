import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/exams_widget.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/gradientCard_widget.dart';
import 'package:flutter_application_1/widgets/home_page/header_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/tabbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            children: <Widget>[
              const HeaderWidget(),
              const TabBarWidget(),
              const ExamsWidget(),
              GradientCardWidget(
                buttonText: 'Profilini oluştur',
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF3c0b8c),
                    Color(0xFFe3a6fe),
                  ],
                ),
                onPressed: () {},
              ),
              GradientCardWidget(
                  buttonText: 'Kendini değerlendir',
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF0e0b93),
                      Color(0xFF5eb6ca),
                    ],
                  ),
                  onPressed: () {}),
              GradientCardWidget(
                  buttonText: 'Öğrenmeye başla',
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF3c0b8c),
                      Color(0xFFe3a6fe),
                    ],
                  ),
                  onPressed: () {}),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
