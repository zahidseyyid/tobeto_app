import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_event.dart';
import 'package:flutter_application_1/api/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/pages/education_details_page.dart';
import 'package:flutter_application_1/pages/evaluation_page.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/pages/catalog_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/sign_in_page.dart';
import 'package:flutter_application_1/pages/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    var logoAsset = getLogo(brightness);
    //final MediaQueryData mediaQueryData = MediaQuery.of(context);
    //final double deviceHeight = mediaQueryData.size.height;
    //final double deviceWidth = mediaQueryData.size.width;
    return Drawer(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          }
        },
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
                              builder: (context) => const EvaluationPage()));
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
                              builder: (context) => const CatalogPage()));
                    },
                    child: const Text('Katalog'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EducationDetailsPage()));
                    },
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
                  contentPadding: paddingHBig,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: const Icon(Icons.person_3_outlined),
                      ),
                      //SizedBox(width: deviceWidth / 20),
                      const Text("UserName"),
                      // SizedBox(width: deviceWidth / 16),
                      GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(AuthLogout());
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
      ),
    );
  }
}
