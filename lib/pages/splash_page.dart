import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late String logoAsset;
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    logoAsset = getLogo(brightness);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoAsset,
              width: deviceWidth / 1.80,
            ),
            SizedBox(height: deviceHeight / 5),
            CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary),
          ],
        ),
      ),
    );
  }
}
