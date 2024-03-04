import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/widgets/home_page/button.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(getLogo(brightness)),
              width: 300,
            ),
            const SizedBox(height: 100),
            const Text(Page404Constants.pageNotFound),
            const SizedBox(height: 50),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/sign_in");
              },
              buttonText: Page404Constants.goToLoginScreen,
              buttonColor: Theme.of(context).colorScheme.secondary,
              buttonTextColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
