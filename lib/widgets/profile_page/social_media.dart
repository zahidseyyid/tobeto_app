import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/custom_card.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher eklenmiş hali

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  // Yeni eklenen fonksiyon
  void onFacebookIconClick() async {
    const url = socialMediaInstagram; // Yönlendirilecek web sitesi URL'si
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Web sitesi açılamıyor: $url';
    }
  }

  void onFacebookIconClick2() async {
    const url = socialMediaLinkedin; // Yönlendirilecek web sitesi URL'si
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Web sitesi açılamıyor: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double deviceWidth = queryData.size.width;
    double deviceHeight = queryData.size.height;
    return SizedBox(
      child: CustomCardWidget(
        width: deviceWidth / 1.1,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: deviceWidth / 20, vertical: deviceHeight / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitle(
                title: "Sosyal Medya Bilgileri",
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              Row(
                children: [
                  GestureDetector(
                    onTap: onFacebookIconClick,
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 100.0,
                    ),
                  ),
                  Padding(padding: paddingSmall),
                  GestureDetector(
                    onTap: onFacebookIconClick2,
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 100.0,
                    ),
                  )
                ],
              )
              // GestureDetector eklenmiş hali
            ],
          ),
        ),
      ),
    );
  }
}
