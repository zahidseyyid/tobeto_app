import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_bloc.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_event.dart';
import 'package:flutter_application_1/api/blocs/catalog/catalog_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/pages/education_details_page.dart';
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
    Color purple = const Color(0xFF9933FF);

    return BlocBuilder<CatalogLessonBloc, CatalogLessonState>(
        builder: (context, state) {
      if (state is CatalogLessonInitial) {
        context.read<CatalogLessonBloc>().add(FetchCategoryLessons());

        return const Center(
          child: Text("İstek atılıyor.."),
        );
      }

      if (state is CatalogLessonInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CatalogLessonError) {
        return const Center(
          child: Text("İstek hatalı.."),
        );
      }
      if (state is CatalogLessonLoaded) {
        //Textfielda yazılan ile filtreleme kısmı
        var categoryLessons = filterLessons(
          state.catalogLessonList,
          Provider.of<StateData>(context, listen: true).pattern,
        );
        return ListView.builder(
          itemCount: categoryLessons.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  // Tıklanılan dersin detay sayfasına yönlendirilmesi
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EducationDetailsPage()));
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
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          Icons.play_circle,
                          size: 40,
                          color: purple,
                        ),
                      ),
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
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.person_outline_sharp,
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
                                          Icons.access_time,
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
      return const Text("No lessons found.");
    });
  }
}
