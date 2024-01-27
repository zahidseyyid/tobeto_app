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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListView.builder(
            itemCount: 8, // Öğe sayısı
            padding: paddingMedium,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return EducationDetailsAboutWidget(
                    title: "Başlangıç:",
                    icon: Icons.calendar_month,
                    description:
                        "${dummyEducations[0].startDate.day}/0${dummyEducations[0].startDate.weekday}/${dummyEducations[0].startDate.year}",
                  );
                case 1:
                  return EducationDetailsAboutWidget(
                    title: "Bitiş:",
                    icon: Icons.calendar_month,
                    description:
                        "${dummyEducations[0].endDate.day}/0${dummyEducations[0].endDate.weekday}/${dummyEducations[0].endDate.year}",
                  );
                case 2:
                  return EducationDetailsAboutWidget(
                    title: "Geçirdiğin Süre:",
                    icon: Icons.watch_later_outlined,
                    description: "${dummyEducations[0].spentTime.inHours} saat"
                        " ${dummyEducations[0].spentTime.inMinutes.remainder(60)} dakika",
                  );
                case 3:
                  return EducationDetailsAboutWidget(
                    title: "Tahmini Süre:",
                    icon: Icons.watch_later_outlined,
                    description: "${dummyEducations[0].estimatedTime.inHours} saat"
                        " ${dummyEducations[0].estimatedTime.inMinutes.remainder(60)} dakika",
                  );
                case 4:
                  return EducationDetailsAboutWidget(
                    title: "Kategori:",
                    icon: Icons.category,
                    description: dummyEducations[0].category,
                  );
                case 5:
                  return EducationDetailsAboutWidget(
                    title: "Eğitimci:",
                    icon: Icons.person,
                    description: dummyEducations[0].teacher,
                  );
                case 6:
                  return EducationDetailsAboutWidget(
                    title: "Video Sayısı:",
                    icon: Icons.language,
                    description: dummyEducations[0].videoCount.toString(),
                  );
                default:
                  return const SizedBox.shrink(); // Fazladan indeksler için boş bir widget döndürür
              }
            },
          ),
        ),
      ),
    );
  }
}
