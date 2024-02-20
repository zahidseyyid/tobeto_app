import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/widgets/education_details_page/education_details_about_widget.dart';

class EducationAbout extends StatefulWidget {
  final Education education;
  const EducationAbout({super.key, required this.education});

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
                        "${widget.education.startDate.day}/0${widget.education.startDate.weekday}/${widget.education.startDate.year}",
                  );
                case 1:
                  return EducationDetailsAboutWidget(
                    title: "Bitiş:",
                    icon: Icons.calendar_month,
                    description:
                        "${widget.education.endDate.day}/0${widget.education.endDate.weekday}/${widget.education.endDate.year}",
                  );
                case 2:
                  return EducationDetailsAboutWidget(
                    title: "Geçirdiğin Süre:",
                    icon: Icons.watch_later_outlined,
                    description: "${widget.education.spentTime.inHours} saat"
                        " ${widget.education.spentTime.inMinutes.remainder(60)} dakika",
                  );
                case 3:
                  return EducationDetailsAboutWidget(
                    title: "Tahmini Süre:",
                    icon: Icons.watch_later_outlined,
                    description:
                        "${widget.education.estimatedTime.inHours} saat"
                        " ${widget.education.estimatedTime.inMinutes.remainder(60)} dakika",
                  );
                case 4:
                  return EducationDetailsAboutWidget(
                    title: "Kategori:",
                    icon: Icons.category,
                    description: widget.education.category,
                  );
                case 5:
                  return EducationDetailsAboutWidget(
                    title: "Eğitimci:",
                    icon: Icons.person,
                    description: widget.education.teacher,
                  );
                case 6:
                  return EducationDetailsAboutWidget(
                    title: "Video Sayısı:",
                    icon: Icons.language,
                    description: widget.education.videoCount.toString(),
                  );
                default:
                  return const SizedBox
                      .shrink(); // Fazladan indeksler için boş bir widget döndürür
              }
            },
          ),
        ),
      ),
    );
  }
}
