import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/pages/evaluation_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/profile_edit_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut() async {
    await firebaseAuthInstance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    var logoAsset = getLogo(brightness);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    //final double deviceHeight = mediaQueryData.size.height;
    final double deviceWidth = mediaQueryData.size.width;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  logoAsset, // Replace with your logo image path
                  width: 200,
                  height: 200,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text('Anasayfa'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EvaluationPage()));
                  },
                  child: const Text('Değerlendirmeler'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: const Text('Profilim'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditPage()));
                  },
                  child: const Text('Katalog'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Takvim'),
                ),
              ],
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Row(
              children: [Text("Tobeto"), Icon(Icons.home_outlined)],
            ),
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(Icons.person_3_outlined),
                    ),
                    SizedBox(width: deviceWidth / 20),
                    Text(firebaseAuthInstance.currentUser!.email.toString()),
                    SizedBox(width: deviceWidth / 7),
                    GestureDetector(
                        onTap: () {
                          signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Icon(Icons.exit_to_app)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('© 2022 Tobeto'),
          ),
        ],
      ),
    );
  }
}
