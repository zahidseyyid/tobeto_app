import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/custom_card.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';

class WorkExperienceWidget extends StatefulWidget {
  const WorkExperienceWidget({super.key});

  @override
  State<WorkExperienceWidget> createState() => _WorkExperienceWidgetState();
}

class _WorkExperienceWidgetState extends State<WorkExperienceWidget> {
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
                title: "Deneyim Bilgileri",
              ),
              Padding(padding: paddingSmall),
              const Divider(
                color: Color.fromRGBO(153, 51, 255, 0.4),
                thickness: 2,
              ),
              Padding(padding: paddingSmall),
              Card(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //width: deviceWidth / 1.8,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: deviceWidth / 4.2,
                              ),
                              const Icon(Icons.school_outlined),
                            ],
                          ),
                          Padding(padding: paddingSmall),
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(Icons.calendar_month_outlined),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Text(
                                "$workExperienceStartDate - $workExperienceEndDate"),
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
                          const Text(
                            workExperienceCompanyName,
                            style: TextStyle(
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
                          const Text(
                            workExperiencePosition,
                            style: TextStyle(
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
                          const Text(
                            workSector,
                            style: TextStyle(
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
                          const Text(
                            workCity,
                            style: TextStyle(
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
                                  content: const Text(workDescription),
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
              ),
              Padding(padding: paddingSmall),
            ],
          ),
        ),
      ),
    );
  }
}
