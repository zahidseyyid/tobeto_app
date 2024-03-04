import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_bloc.dart';
import 'package:flutter_application_1/logic/blocs/lesson/lesson_state.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LessonItemWidget extends StatelessWidget {
  const LessonItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    List<Education> lessonList;
    final lessonBlocState = context.watch<LessonBloc>().state;

    if (lessonBlocState is LessonLoaded) {
      lessonList = lessonBlocState.educationList;
      //Textfielda yazılan ile filtreleme kısmı
      var filtering = filterLessons(
        lessonList,
        Provider.of<StateData>(context, listen: true).pattern,
      );

      //Neye göre sıralayacağımı tuttuğum global stateden çektim
      String sortData = Provider.of<StateData>(context, listen: true).sort;

      sortLessons(
          filtering, sortData); //Dropdown menüden seçilene göre sıralama
      return ListView.builder(
          itemCount: filtering.length,
          shrinkWrap: true, //liste boyutuna göre ayarla
          physics: const NeverScrollableScrollPhysics(), //scroll olmaması için
          padding: paddingAllMedium,
          itemBuilder: (context, index) {
            return Padding(
              padding: paddingAllSmall,
              child: Container(
                height: deviceHeight * .27,
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
                            image:
                                NetworkImage(filtering[index].image.toString()),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      filtering[index].title.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy kk:mm')
                              .format(filtering[index].startDate)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                          icon: LessonConstants.rightArrowIcon,
                          onPressed: () {
                            Navigator.pushNamed(context, "/lesson_detail",
                                arguments: filtering[index]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    } else {
      return const Text(LessonConstants.lessonsNotFound);
    }
  }
}

void sortLessons(List<Education> list, String sortData) {
  switch (sortData) {
    case "Adına göre (Z-A)":
      list.sort((a, b) => b.title.compareTo(a.title));
      break;
    case "Tarihe göre (Y-E)":
      list.sort((a, b) => b.startDate.compareTo(a.startDate));
      break;
    case "Tarihe göre (E-Y)":
      list.sort((a, b) => a.startDate.compareTo(b.startDate));
      break;
    default:
      //"Adına göre alfabetik sırayla (A-Z)"
      list.sort((a, b) => a.title.compareTo(b.title));
      break;
  }
}

List<Education> filterLessons(List<Education> lessons, String pattern) {
  return lessons
      .where((element) => element.title.toLowerCase().contains(pattern))
      .toList();
}
