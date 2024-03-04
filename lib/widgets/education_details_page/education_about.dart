import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/widgets/education_details_page/education_details_about_widget.dart';

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
          padding: paddingHMedium + paddingMedium,
          child: ListView.builder(
            itemCount: 8, // Öğe sayısı
            padding: paddingMedium,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.startDate,
                    icon: LessonDetailsConstants.calendarIcon,
                    description:
                        "${widget.education.startDate.day}/0${widget.education.startDate.weekday}/${widget.education.startDate.year}",
                  );
                case 1:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.endDate,
                    icon: LessonDetailsConstants.calendarIcon,
                    description:
                        "${widget.education.endDate.day}/0${widget.education.endDate.weekday}/${widget.education.endDate.year}",
                  );
                case 2:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.spendTime,
                    icon: LessonDetailsConstants.watchIcon,
                    description:
                        "${widget.education.spentTime.inHours} ${LessonDetailsConstants.hour}"
                        " ${widget.education.spentTime.inMinutes.remainder(60)} ${LessonDetailsConstants.minute}",
                  );
                case 3:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.estimatedTime,
                    icon: LessonDetailsConstants.watchIcon,
                    description:
                        "${widget.education.estimatedTime.inHours} ${LessonDetailsConstants.hour}"
                        " ${widget.education.estimatedTime.inMinutes.remainder(60)}${LessonDetailsConstants.minute}",
                  );
                case 4:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.category,
                    icon: LessonDetailsConstants.categoryIcon,
                    description: widget.education.category,
                  );
                case 5:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.teacher,
                    icon: LessonDetailsConstants.personIcon,
                    description: widget.education.teacher,
                  );
                case 6:
                  return EducationDetailsAboutWidget(
                    title: LessonDetailsConstants.videoCount,
                    icon: LessonDetailsConstants.languageIcon,
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
