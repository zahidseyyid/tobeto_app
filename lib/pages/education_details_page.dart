import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/datas/education_dummy_data.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/education_details_page/education_about.dart';
import 'package:flutter_application_1/widgets/education_details_page/education_list_tile.dart';
import 'package:flutter_application_1/widgets/education_details_page/video_player.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessons_widget.dart';

class EducationDetailsPage extends StatefulWidget {
  const EducationDetailsPage({Key? key, this.lessonId}) : super(key: key);
  final String? lessonId;

  @override
  State<EducationDetailsPage> createState() => _EducationDetailsPageState();
}

class _EducationDetailsPageState extends State<EducationDetailsPage> {
  final videoUrlNotifier = ValueNotifier<String>(dummyEducations[0].videoList[0].link);
  int selectedVideoIndex = 0;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: deviceWidth * 0.24,
                height: deviceHeight * 0.12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage(dummyEducations[0].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dummyEducations[0].title, style: Theme.of(context).textTheme.titleMedium),
                  Padding(padding: paddingMedium),
                  Row(
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.5,
                        child: LinearProgressIndicator(
                          color: Colors.greenAccent,
                          backgroundColor: Colors.grey,
                          value: dummyEducations[0].progress / 100,
                          minHeight: deviceHeight * 0.02,
                        ),
                      ),
                      Padding(padding: paddingHSmall),
                      Text("${dummyEducations[0].progress}%", style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: paddingSmall),
          ValueListenableBuilder<String>(
            valueListenable: videoUrlNotifier,
            builder: (context, value, child) {
              return CustomVideoPlayer(
                videoUrlNotifier: videoUrlNotifier,
                height: deviceHeight * 0.25,
                width: deviceWidth * 1,
              );
            },
          ),
          Padding(padding: paddingSmall),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelColor: Theme.of(context).colorScheme.primary,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.all(10),
                    labelStyle: const TextStyle(fontSize: 20),
                    tabAlignment: TabAlignment.start,
                    tabs: List.generate(2, (index) {
                      if (index == 0) {
                        return const Tab(text: "İçerik");
                      } else if (index == 1) {
                        return const Tab(text: "Hakkında");
                      }
                      return const Tab(text: "");
                    }),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: paddingMedium,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: dummyEducations[0].videoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  videoUrlNotifier.value = dummyEducations[0].videoList[index].link;
                                  setState(() {
                                    selectedVideoIndex = index; // Seçili video indeksini güncelleyin
                                  });
                                },
                                child: Card(
                                  elevation: 3,
                                  color: selectedVideoIndex == index
                                      ? const Color.fromARGB(255, 202, 198, 198)
                                      : Colors.white, // Seçili öğe mavi olarak belirlenir
                                  child: EducationListTile(video: dummyEducations[0].videoList[index]),
                                ),
                              );
                            },
                          ),
                        ),
                        const EducationAbout(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
