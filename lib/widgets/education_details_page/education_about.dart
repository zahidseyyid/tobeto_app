import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/datas/education_dummy_data.dart';
import 'package:flutter_application_1/widgets/education_details_page/education_details_about_widget.dart';

class EducationAbout extends StatefulWidget {
  const EducationAbout({super.key});

  @override
  State<EducationAbout> createState() => _EducationAboutState();
}

class _EducationAboutState extends State<EducationAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          EducationDetailsAboutWidget(
              title: "Başlangıç:",
              icon: Icons.calendar_month,
              description:
                  "${dummyEducations[0].startDate.day}/0${dummyEducations[0].startDate.weekday}/${dummyEducations[0].startDate.year}"),
          EducationDetailsAboutWidget(
              title: "Bitiş:",
              icon: Icons.calendar_month,
              description:
                  "${dummyEducations[0].endDate.day}/0${dummyEducations[0].endDate.weekday}/${dummyEducations[0].endDate.year}"),
          Padding(padding: paddingSmall),
          EducationDetailsAboutWidget(
              title: "Geçirdiğin Süre:",
              icon: Icons.watch_later_outlined,
              description: "${dummyEducations[0].spentTime.inHours} saat"
                  " ${dummyEducations[0].spentTime.inMinutes.remainder(60)} dakika"),
          Padding(padding: paddingSmall),
          EducationDetailsAboutWidget(
              title: "Tahmini Süre:",
              icon: Icons.watch_later_outlined,
              description: "${dummyEducations[0].estimatedTime.inHours} saat"
                  " ${dummyEducations[0].estimatedTime.inMinutes.remainder(60)} dakika"),
          Padding(padding: paddingSmall),
          EducationDetailsAboutWidget(
              title: "Kategori:", icon: Icons.category, description: dummyEducations[0].category),
          Padding(padding: paddingSmall),
          EducationDetailsAboutWidget(title: "Eğitimci:", icon: Icons.person, description: dummyEducations[0].teacher),
          Padding(padding: paddingSmall),
          EducationDetailsAboutWidget(
              title: "Video Sayısı:", icon: Icons.language, description: dummyEducations[0].videoCount.toString()),
        ],
      )),
    );
  }
}
