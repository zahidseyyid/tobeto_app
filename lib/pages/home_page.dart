import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/exams_widget.dart';
import 'package:flutter_application_1/widgets/home_page/header_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(getLogo(brightness), width: 125),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWidget(),
            TabBarWidget(),
            ExamsWidget(),
            //TopBarWidget(),
          ],
        ),
      ),
    );
  }
}
