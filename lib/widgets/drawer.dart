import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var logoAsset = Theme.of(context).brightness == Brightness.dark
        ? "lib/assets/tobetoDarkModeLogo.png"
        : "lib/assets/tobetoLightModeLogo.png";
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
                  onPressed: () {},
                  child: const Text('Anasayfa'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Değerlendirmeler'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: const Text('Profilim'),
                ),
                TextButton(
                  onPressed: () {},
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
          const Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Halit Enes Kalaycı'),
                    CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
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
