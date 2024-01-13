import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/custom_card.dart';
import 'package:flutter_application_1/widgets/custom_circle_avatar.dart';
import 'package:flutter_application_1/widgets/custom_profile_sizedbox.dart';

class ProfileInformationWidget extends StatefulWidget {
  const ProfileInformationWidget({super.key});

  @override
  State<ProfileInformationWidget> createState() =>
      _ProfileInformationWidgetState();
}

class _ProfileInformationWidgetState extends State<ProfileInformationWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double deviceWidth = queryData.size.width;
    double deviceHeight = queryData.size.height;
    return SizedBox(
      child: CustomCardWidget(
        //height: deviceHeight / 2.4,
        width: deviceWidth / 1.1,
        child: Column(
          children: [
            Container(
              height: deviceHeight / 7,
              width: deviceWidth / 1.1,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomCircleAvatar(),
                  ),
                ],
              ),
            ),
            Padding(padding: paddingMedium),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.person_2_outlined,
              title: "Ad Soyad",
              infoText: "$userName $userSurname",
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.calendar_month_outlined,
              title: "Doğum Tarihi",
              infoText: userBirthday,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.email_outlined,
              title: "E-posta Adresi",
              infoText: userEmail,
            ),
            Padding(padding: paddingSmall),
            CustomProfileSizedBox(
              deviceWidth: deviceWidth,
              icon: Icons.phone_outlined,
              title: "Telefon Numarası",
              infoText: userPhone,
            ),
            Padding(padding: paddingMedium),
          ],
        ),
      ),
    );
  }
}
