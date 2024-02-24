import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

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
            const Text("Sayfa Bulunamadı. 404 Hatası!"),
            const SizedBox(height: 50),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/sign_in");
              },
              buttonText: "Giriş Ekranına Git",
              buttonColor: Theme.of(context).colorScheme.secondary,
              buttonTextColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
