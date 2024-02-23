import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_event.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_state.dart';
import 'package:flutter_application_1/pages/lesson_details_page.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/surveys_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LessonsWidget extends StatefulWidget {
  const LessonsWidget({super.key, required this.lessonList});
  final List<String> lessonList;

  @override
  State<LessonsWidget> createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state is LessonInitial) {
          context
              .read<LessonBloc>()
              .add(FetchUserLessons(userLessonList: widget.lessonList));
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LessonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LessonError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is LessonLoaded) {
          if (state.educationList.isNotEmpty) {
            final itemCounter =
                state.educationList.length < 3 ? state.educationList.length : 3;
            return Padding(
              padding: paddingOnlyLeftMedium,
              child: Container(
                width: deviceWidth,
                color: Theme.of(context).colorScheme.background,
                child: ListView.builder(
                  itemCount: itemCounter +
                      1, // 3 ders + daha fazla göster butonunu için
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == itemCounter) {
                      return IconButton(
                        //Daha fazla göster butonu
                        icon: LessonConstants.rightArrowIcon,
                        iconSize: 35,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/lesson");
                        },
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: deviceWidth * 0.8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                offset: Offset(
                                  3.0,
                                  3.0,
                                ),
                              ),
                            ],
                          ),
                          padding: paddingAllSmall,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(state
                                          .educationList[index].image
                                          .toString()),
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: paddingOnlyBottomSmall,
                              ),
                              Text(
                                state.educationList[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      DateFormat('dd-MM-yyyy kk:mm')
                                          .format(state
                                              .educationList[index].startDate)
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  IconButton(
                                    icon: LessonConstants.rightArrowIcon,
                                    onPressed: () {
                                      //Dersin detayı sayfasına gidecek
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LessonDetailPage(
                                                      education:
                                                          state.educationList[
                                                              index])));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          } else {
            return const SurveysWidget(LessonConstants.lessonsNotFound);
          }
        }
        return const Text(LessonConstants.lessonsNotFound);
      },
    );
  }
}
