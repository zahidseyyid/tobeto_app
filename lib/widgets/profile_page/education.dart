// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/education_history.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({super.key});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      print("fetched : EducationWidget");
      userProfile = userBlocState.user;
    } else {
      print("else : EducationWidget");
    }
    if (userProfile == null) {
      return const Center(child: Text(EducationPageConstants.userNotFound));
    }
    List<EducationHistory>? userProfileEducation = userProfile.educationHistory;
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
                title: EducationPageConstants.educationPageTitle,
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(41, 33, 50, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              userProfileEducation!.isEmpty
                  ? const Center(
                      child: Text(EducationPageConstants.educationNotFound))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: userProfileEducation.map((education) {
                        return Padding(
                          padding: paddingHSmall,
                          child: EducationCard(
                            educationStartDate: education.startDate,
                            educationEndDate: education.endDate,
                            educationSchoolName: education.schoolName,
                            educationDepartment: education.department,
                            educationStatus: education.educationStatus,
                          ),
                        );
                      }).toList()),
                    ),
              //EducationCard(deviceWidth: deviceWidth),
              Padding(padding: paddingSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String educationStartDate;
  final String educationEndDate;
  final String educationSchoolName;
  final String educationDepartment;
  final String educationStatus;
  const EducationCard({
    super.key,
    required this.educationStartDate,
    required this.educationEndDate,
    required this.educationSchoolName,
    required this.educationDepartment,
    required this.educationStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: Theme.of(context).colorScheme.onError,
            shape: BoxShape.rectangle),
        padding: paddingMedium + paddingHMedium,
        //width: deviceWidth / 1.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: paddingSmall),
            Row(mainAxisSize: MainAxisSize.min, children: [
              EducationPageConstants.calendarIcon,
              Padding(padding: paddingSmall),
              Text("$educationStartDate - $educationEndDate"),
            ]),
            Padding(padding: paddingSmall),
            const Text(
              EducationPageConstants.educationSchoolName,
              style: EducationPageConstants.textStyleGrey,
            ),
            Padding(padding: paddingSmall),
            Text(
              educationSchoolName,
              style: EducationPageConstants.textStyle,
            ),
            Padding(padding: paddingSmall),
            const Text(
              EducationPageConstants.educationDepartment,
              style: EducationPageConstants.textStyleGrey,
            ),
            Padding(padding: paddingSmall),
            Text(
              educationDepartment,
              style: EducationPageConstants.textStyle,
            ),
            Padding(padding: paddingSmall),
            const Text(
              EducationPageConstants.educationStatus,
              style: EducationPageConstants.textStyleGrey,
            ),
            Padding(padding: paddingSmall),
            Text(
              educationStatus,
              style: EducationPageConstants.textStyle,
            ),
            Padding(padding: paddingSmall),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardTitle extends StatefulWidget {
  String title;
  CardTitle({
    super.key,
    required this.title,
  });

  @override
  State<CardTitle> createState() => _CardTitleState();
}

class _CardTitleState extends State<CardTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
