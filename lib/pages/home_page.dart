// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/exams_widget.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/gradientcard_widget.dart';

import 'package:flutter_application_1/widgets/home_page/header_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/tabbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data yükleyiciyi tetiklemek için kullanılan kodlar
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // for (var edu in dummyEducationsList) {
    //   firestore.collection('education').doc(edu.id).set(edu.toMap());
    // }
    Brightness brightness = Theme.of(context).brightness;
    return ChangeNotifierProvider<StateData>(
      //Bildirim güncellenmesi için ChangeNotifierProvider ile sarmalladım
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
                title: "Profilini oluştur",
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFbda6fe),
                    Color(0xFF1d0b8c),
                  ],
                ),
                onPressed: () {},
              ),
              GradientCardWidget(
                  title: 'Kendini değerlendir',
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
                  title: 'Öğrenmeye başla',
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
