import 'package:flutter/material.dart';

class LessonsWidget extends StatelessWidget {
  const LessonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> constLessonsInfo = [
      {
        "img": "https://tobeto.s3.cloud.ngn.com.tr/23_EAH_1_45f7232003.jpg",
        "title": "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
        "date": "21 Eylül 2023 15:20"
      },
      {
        "img": "https://tobeto.s3.cloud.ngn.com.tr/23_ENK_1_b4d858c1a9.jpg",
        "title": "Eğitimlere Nasıl Katılırım?",
        "date": "8 Eylül 2023 17:06"
      },
      {
        "img": "https://tobeto.s3.cloud.ngn.com.tr/CFE_20231_0013fd70c1.jpg",
        "title": "Herkes İçin Kodlama - 1A",
        "date": "18 Eylül 2023 03:00"
      },
      {
        "img":
            "https://tobeto.s3.cloud.ngn.com.tr/Paragraf_metniniz_6_099683c80d.png",
        "title": "Mobil Geliştirici (Flutter) - 1B",
        "date": "23 Ekim 2023 03:00"
      }
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
          itemCount: constLessonsInfo.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
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
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                constLessonsInfo[index]["img"].toString()),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            constLessonsInfo[index]["title"].toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                constLessonsInfo[index]["date"].toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.chevron_right_sharp),
                                onPressed: () {
                                  print(
                                      "object"); //Tıklanınca başka sayfaya yön
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
