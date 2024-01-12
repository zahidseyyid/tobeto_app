import 'package:flutter/material.dart';
import 'package:flutter_application_1/datas/lesson_dummy_data.dart';
import 'package:flutter_application_1/pages/lessons_page.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/edu_tabbar.dart';
import 'package:intl/intl.dart';

class LessonsWidget extends StatelessWidget {
  const LessonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: deviceWidth,
        color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
          itemCount: 4, // 3 ders + daha fazla göster butonunu için
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 3) {
              return IconButton(
                //Daha fazla göster butonu
                icon: const Icon(Icons.chevron_right_sharp),
                iconSize: 35,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LessonsPage(),
                    ),
                  );
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
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  lessonsData[index].img.toString()),
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
                        lessonsData[index].title.toString(),
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
                                .format(lessonsData[index].date)
                                .toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right_sharp),
                            onPressed: () {
                              //Dersin detayı sayfasına gidecek
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
  }
}
