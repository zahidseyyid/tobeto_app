import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/constant_text.dart';
import 'package:flutter_application_1/widgets/custom_card.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({super.key});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
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
                title: "Eğitim Bilgileri",
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
                  child: Column(
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
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
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
                      const Text(
                        educationSchoolName,
                        style: TextStyle(
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
                      const Text(
                        educationDepartment,
                        style: TextStyle(
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
                      const Text(
                        educationStatus,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: paddingSmall),
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
