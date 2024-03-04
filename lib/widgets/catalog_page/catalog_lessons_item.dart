import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_event.dart';
import 'package:flutter_application_1/logic/blocs/catalog/catalog_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CatalogLessonsItem extends StatefulWidget {
  const CatalogLessonsItem({super.key});

  @override
  State<CatalogLessonsItem> createState() => _CatalogLessonsItemState();
}

List<Education> filterLessons(List<Education> lessons, String pattern) {
  return lessons
      .where((element) => element.title.toLowerCase().contains(pattern))
      .toList();
}

class _CatalogLessonsItemState extends State<CatalogLessonsItem> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogLessonBloc>().add(ResetFetchLessons());
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    Color color = Theme.of(context).colorScheme.background;
    Color purple = Theme.of(context).colorScheme.secondary;

    return BlocBuilder<CatalogLessonBloc, CatalogLessonState>(
        builder: (context, state) {
      if (state is CatalogLessonInitial) {
        context.read<CatalogLessonBloc>().add(FetchCategoryLessons());

        return const Center(child: CustomCircularProgress());
      } else if (state is CatalogLessonLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CatalogLessonError) {
        ToastHelper.showErrorToast(state.errorMessage);
      } else if (state is CatalogLessonLoaded) {
        //Textfielda yazılan ile filtreleme kısmı
        var categoryLessons = filterLessons(
          state.catalogLessonList,
          Provider.of<StateData>(context, listen: true).pattern,
        );
        return ListView.builder(
          itemCount: categoryLessons.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: paddingAllMedium,
          itemBuilder: (context, index) {
            return Padding(
              padding: paddingMedium,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/lesson_detail",
                      arguments: categoryLessons[index]);
                },
                child: Container(
                  height: deviceHeight * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white70),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(categoryLessons[index].image),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                          top: 20,
                          right: 20,
                          child: CatalogConstants.videoPlayIcon),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: purple.withOpacity(0.7),
                              ),
                              child: Padding(
                                padding: paddingAllMedium,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          CatalogConstants.person,
                                          color: color,
                                        ),
                                        Padding(padding: paddingHSmall),
                                        Text(
                                          categoryLessons[index].teacher,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: color,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(padding: paddingHSmall),
                                        Icon(
                                          CatalogConstants.accessTime,
                                          color: color,
                                        ),
                                        Padding(padding: paddingHSmall),
                                        Text(
                                          "${categoryLessons[index].estimatedTime.inMilliseconds ~/ 60}s ${categoryLessons[index].estimatedTime.inMilliseconds % 60}dk",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: color,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: paddingHMedium),
                                    Text(
                                      categoryLessons[index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
      return const Text(LessonConstants.lessonsNotFound);
    });
  }
}
