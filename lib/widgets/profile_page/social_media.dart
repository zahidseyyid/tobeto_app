import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/user/user_bloc.dart';
import 'package:tobeto_app/logic/blocs/user/user_state.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/user_profile_model/social_media_account.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_card.dart';
import 'package:tobeto_app/widgets/profile_page/education.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher eklenmiş hali

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

void onSocialIconClick(String username, platform) async {
  // ignore: deprecated_member_use
  String newUrl = "https://www.$platform.com/$username";
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
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user;
    }
    List<SocialMedia>? userProfileSocialMedia = userProfile?.socialMedia;
    MediaQueryData queryData = MediaQuery.of(context);
    double deviceWidth = queryData.size.width;
    return SizedBox(
      child: CustomCardWidget(
        width: deviceWidth / 1.1,
        child: Padding(
          padding: paddingBig + paddingHBig,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitle(
                title: SocialMediaConstants.socialMediaTitle,
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              userProfileSocialMedia == null
                  ? const Center(
                      child: Text(SocialMediaConstants.socialMediaNotFound))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: userProfileSocialMedia.map((socialMedia) {
                          return Padding(
                            padding: paddingHSmall,
                            child: SocialMediaItem(
                              username: socialMedia.username,
                              platform: socialMedia.platform,
                            ),
                          );
                        }).toList(),
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
  final String platform;
  const SocialMediaItem(
      {super.key, required this.username, required this.platform});
  @override
  Widget build(BuildContext context) {
    if (platform == SocialMediaEditConstants.dropdownTwitter) {
      return GestureDetector(
        onTap: () => onSocialIconClick(username, platform),
        child: SocialMediaConstants.twitterIcon,
      );
    } else if (platform == SocialMediaEditConstants.dropdownFacebook) {
      return GestureDetector(
          onTap: () => onSocialIconClick(username, platform),
          child: SocialMediaConstants.facebookIcon);
    } else {
      return GestureDetector(
        onTap: () => onSocialIconClick(username, platform),
        child: SocialMediaConstants.instagramIcon,
      );
    }
  }
}
