import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_card.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({
    super.key,
  });

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user;
    }
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
                title: AboutMeConstants.aboutMeTitle,
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              userProfile?.about == null
                  ? const Text(AboutMeConstants.aboutMeNotFound)
                  : Text(userProfile?.about ?? "",
                      style: AboutMeConstants.textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
