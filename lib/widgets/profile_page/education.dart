import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
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
      userProfile = userBlocState.user;
    }
    List<EducationHistory>? userProfileEducation =
        userProfile?.educationHistory;
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
                title: "Eğitim Bilgileri",
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(41, 33, 50, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              SizedBox(
                height: deviceHeight / 2.5,
                child: userProfileEducation == null
                    ? const Center(child: Text("Ders bilgisi yok"))
                    : ListView.builder(
                        shrinkWrap: true, // Gerekli olabilir
                        scrollDirection: Axis.horizontal,
                        itemCount: userProfileEducation.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: paddingHSmall,
                            child: EducationCard(
                              deviceWidth: deviceWidth,
                              educationStartDate:
                                  userProfileEducation[index].startDate,
                              educationEndDate:
                                  userProfileEducation[index].endDate,
                              educationSchoolName:
                                  userProfileEducation[index].schoolName,
                              educationDepartment:
                                  userProfileEducation[index].department,
                              educationStatus:
                                  userProfileEducation[index].educationStatus,
                            ),
                          );
                        },
                      ),
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
    required this.deviceWidth,
    required this.educationStartDate,
    required this.educationEndDate,
    required this.educationSchoolName,
    required this.educationDepartment,
    required this.educationStatus,
  });

  final double deviceWidth;

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //width: deviceWidth / 1.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: paddingSmall),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.calendar_month_outlined),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text("$educationStartDate - $educationEndDate"),
            ]),
            Padding(padding: paddingSmall),
            const Text(
              "Okul Adı",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF828282)),
            ),
            Padding(padding: paddingSmall),
            Text(
              educationSchoolName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(padding: paddingSmall),
            const Text(
              "Bölüm",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF828282)),
            ),
            Padding(padding: paddingSmall),
            Text(
              educationDepartment,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(padding: paddingSmall),
            const Text(
              "Eğitim Seviyesi",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF828282)),
            ),
            Padding(padding: paddingSmall),
            Text(
              educationStatus,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
