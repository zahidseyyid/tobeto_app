import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/social_media_account.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_card.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher eklenmiş hali

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

void onFacebookIconClick(String username) async {
  // ignore: deprecated_member_use
  String newUrl = "https://www.instagram.com/$username";
  // ignore: deprecated_member_use
  if (await canLaunch(newUrl)) {
    // ignore: deprecated_member_use
    await launch(newUrl);
  } else {
    throw 'Web sitesi açılamıyor: $newUrl';
  }
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    UserProfile userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
    } else {
      userProfile =
          UserProfile(idNo: "idNo", nameSurname: "nameSurname", email: "email");
    }
    // print(userProfile.about);
    List<SocialMedia> userProfileSocialMedia = userProfile.socialMedia!;
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
              SizedBox(
                height: deviceHeight / 6,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileSocialMedia.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: paddingHSmall,
                      child: SocialMediaItem(
                          username: userProfileSocialMedia[index].username),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaItem extends StatelessWidget {
  final String username;
  const SocialMediaItem({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onFacebookIconClick(username),
      child: const Icon(
        Icons.facebook,
        color: Colors.blue,
        size: 100.0,
      ),
    );
  }
}
