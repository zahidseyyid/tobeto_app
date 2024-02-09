import 'package:flutter/material.dart';
import 'package:flutter_application_1/datas/lesson_dummy_data.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/models/lesson_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LessonItemWidget extends StatelessWidget {
  const LessonItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    //Textfielda yazılan ile filtreleme kısmı
    var filtering = filterLessons(
      lessonsData,
      Provider.of<StateData>(context, listen: true).pattern,
    );

    //Neye göre sıralayacağımı tuttuğum global stateden çektim
    String sortData = Provider.of<StateData>(context, listen: true).sort;

    sortLessons(filtering, sortData); //Dropdown menüden seçilene göre sıralama

    return ListView.builder(
        itemCount: filtering.length,
        shrinkWrap: true, //liste boyutuna göre ayarla
        physics: const NeverScrollableScrollPhysics(), //scroll olmaması için
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
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
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(filtering[index].img.toString()),
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
                            .format(filtering[index].date!)
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right_sharp),
                        onPressed: () {
                          //Dersin detayı sayfasına yönlendirilecek
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

void sortLessons(List<LessonModel> list, String sortData) {
  switch (sortData) {
    case "Adına göre (Z-A)":
      list.sort((a, b) => b.title.compareTo(a.title));
      break;
    case "Tarihe göre (Y-E)":
      list.sort((a, b) => b.date!.compareTo(a.date!));
      break;
    case "Tarihe göre (E-Y)":
      list.sort((a, b) => a.date!.compareTo(b.date!));
      break;
    default:
      //"Adına göre alfabetik sırayla (A-Z)"
      list.sort((a, b) => a.title.compareTo(b.title));
      break;
  }
}

List<LessonModel> filterLessons(List<LessonModel> lessons, String pattern) {
  return lessons
      .where((element) => element.title.toLowerCase().contains(pattern))
      .toList();
}
