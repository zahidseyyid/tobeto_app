import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
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
    UserProfile userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
    } else {
      userProfile = UserProfile(idNo: "", nameSurname: "", email: "");
    }
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
                title: "Hakkımda",
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              Text(
                userProfile.about ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
