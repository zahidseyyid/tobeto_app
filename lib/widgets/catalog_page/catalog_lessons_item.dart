import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/datas/lesson_dummy_data.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/lesson_item_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class CatalogLessonsItem extends StatelessWidget {
  const CatalogLessonsItem({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    Color color = Theme.of(context).colorScheme.background;
    Color purple = const Color(0xFF9933FF);

    //Textfielda yazılan ile filtreleme kısmı
    var categoryLessons = filterLessons(
      catalogLessonsData,
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
            },
            child: Container(
              height: deviceHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white70),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(categoryLessons[index].img.toString()),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.person_outline_sharp,
                                      color: color,
                                    ),
                                    Padding(padding: paddingHSmall),
                                    Text(
                                      categoryLessons[index].teacher ?? "",
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
                                      categoryLessons[index].lessonDuration ??
                                          "",
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
                                  categoryLessons[index].title.toString(),
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
}
