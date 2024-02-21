// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/models/user_profile_model/work_history.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_card.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkExperienceWidget extends StatefulWidget {
  const WorkExperienceWidget({Key? key}) : super(key: key);

  @override
  State<WorkExperienceWidget> createState() => _WorkExperienceWidgetState();
}

class _WorkExperienceWidgetState extends State<WorkExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      print("fetched : WorkExperienceWidget");
      userProfile = userBlocState.user;
    } else {
      print("else : WorkExperienceWidget");
    }
    if (userProfile == null) {
      return const Center(child: Text("Kullanıcı bilgisi bulunamadı"));
    }
    List<WorkHistory>? userProfileWork = userProfile.workHistory;
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
                title: "Deneyim Bilgileri",
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              userProfileWork!.isEmpty
                  ? const Center(child: Text("Deneyim Bilgisi Eklenmedi"))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: userProfileWork.map((work) {
                        return Padding(
                          padding: paddingHSmall,
                          child: WorkHistoryCard(
                            workStartDate: work.startDate,
                            workEndDate: work.endDate,
                            workCompanyName: work.company,
                            workPosition: work.position,
                            workSector: work.sector,
                            workCity: work.city,
                            workDescription: work.description,
                          ),
                        );
                      }).toList()),
                    ),
              Padding(padding: paddingSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkHistoryCard extends StatelessWidget {
  final String workStartDate;
  final String workEndDate;
  final String workCompanyName;
  final String workPosition;
  final String workSector;
  final String workCity;
  final String workDescription;
  const WorkHistoryCard({
    super.key,
    required this.workStartDate,
    required this.workEndDate,
    required this.workCompanyName,
    required this.workPosition,
    required this.workSector,
    required this.workCity,
    required this.workDescription,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //width: deviceWidth / 1.8,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: paddingBig),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.calendar_month_outlined),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Text("$workStartDate - $workEndDate"),
                ]),
                Padding(padding: paddingSmall),
                const Text(
                  "Kurum Adı",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828282)),
                ),
                Padding(padding: paddingSmall),
                Text(
                  workCompanyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: paddingSmall),
                const Text(
                  "Pozisyon",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828282)),
                ),
                Padding(padding: paddingSmall),
                Text(
                  workPosition,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: paddingSmall),
                const Text(
                  "Sektör",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828282)),
                ),
                Padding(padding: paddingSmall),
                Text(
                  workSector,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: paddingSmall),
                const Text(
                  "Şehir",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828282)),
                ),
                Padding(padding: paddingSmall),
                Text(
                  workCity,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Positioned(
              top: -15,
              right: -10,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Deneyim Açıklaması"),
                        content: Text(workDescription),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Kapat"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.info_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
