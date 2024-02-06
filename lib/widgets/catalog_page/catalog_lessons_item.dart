import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/pages/education_details_page.dart';

final firebaseFireStore = FirebaseFirestore.instance;

class CatalogLessonsItem extends StatefulWidget {
  const CatalogLessonsItem({super.key});

  @override
  State<CatalogLessonsItem> createState() => _CatalogLessonsItemState();
}

class _CatalogLessonsItemState extends State<CatalogLessonsItem> {
  void getLessons() async {
    FirebaseFirestore.instance.collection('lessons').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print('Lesson title: ${doc['title']}');
        print('Lesson image: ${doc['img']}');
        print('Lesson category: ${doc['category']}');
        print('Lesson duration: ${doc['duration']}');
        //print(doc);
      }
    }).catchError((error) {
      print('Failed to get lessons: $error');
    });
  }

  Future<List<Map<String, dynamic>>> _getLessonsByCategory(String category) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('lessons')
          .where('category', isEqualTo: category)
          .orderBy(FieldPath.documentId, descending: true) //ilk eklediğim verinin en üstte gözükmesi için
          .get();

      List<Map<String, dynamic>> lessons = [];
      for (var doc in querySnapshot.docs) {
        lessons.add({
          'title': doc['title'],
          'img': doc['img'],
          'category': doc['category'],
          'duration': doc['duration'],
          'teacher': doc['teacher'],
        });
      }
      return lessons;
    } catch (error) {
      print('Failed to get lessons: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    Color color = Theme.of(context).colorScheme.background;
    Color purple = const Color(0xFF9933FF);
    //getLessons();

    //Textfielda yazılan ile filtreleme kısmı
    // var categoryLessons = filterLessons(
    //   catalogLessonsData,
    //   Provider.of<StateData>(context, listen: true).pattern,
    // );

    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _getLessonsByCategory("katalog"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Failed to fetch data: ${snapshot.error}");
          } else {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
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
                            context, MaterialPageRoute(builder: (context) => const EducationDetailsPage()));
                      },
                      child: Container(
                        height: deviceHeight * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white70),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(snapshot.data![index]['img'] ?? ""),
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
                                                snapshot.data![index]['teacher'] ?? "",
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
                                                snapshot.data![index]['duration'] ?? "",
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
                                            snapshot.data![index]['title']!,
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
          }
        });
  }
}
