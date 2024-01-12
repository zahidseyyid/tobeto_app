import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/profile_page/icon_tabbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: IconTabBarWidget(),
        ));
  }
}
