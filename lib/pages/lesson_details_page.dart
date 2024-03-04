import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/models/education_model.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/education_details_page/education_about.dart';
import 'package:tobeto_app/widgets/education_details_page/education_list_tile.dart';
import 'package:tobeto_app/widgets/education_details_page/video_player.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LessonDetailPage extends StatefulWidget {
  final Education education;

  const LessonDetailPage({Key? key, required this.education}) : super(key: key);

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  late final ValueNotifier<String> videoUrlNotifier;
  int selectedVideoIndex = 0;
  bool isLiked = false;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    videoUrlNotifier =
        ValueNotifier<String>(widget.education.videoList[0].link);
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: deviceWidth * 0.22,
                height: deviceHeight * 0.12,
                child: Padding(
                  padding: paddingAllMedium,
                  child: Image(
                    image: NetworkImage(widget.education.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: deviceWidth * 0.7,
                    child: Text(
                      widget.education.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: null,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.38,
                        child: LinearProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                          backgroundColor: Colors.grey,
                          value: widget.education.progress / 100,
                          minHeight: deviceHeight * 0.02,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(padding: paddingHSmall),
                      Text("${widget.education.progress}%",
                          style: Theme.of(context).textTheme.titleMedium),
                      IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                              isLiked
                                  ? ToastHelper.showSuccesToast(
                                      LessonDetailsConstants.lessonLiked)
                                  : ToastHelper.showErrorToast(
                                      LessonDetailsConstants.lessonDisliked);
                            });
                          },
                          icon: isLiked
                              ? const Icon(FontAwesomeIcons.solidHeart)
                              : const Icon(FontAwesomeIcons.heart)),
                      IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                              isFavorited
                                  ? ToastHelper.showSuccesToast(
                                      LessonDetailsConstants.lessonAddFavorites)
                                  : ToastHelper.showErrorToast(
                                      LessonDetailsConstants
                                          .lessonRemovedToFavorites);
                            });
                          },
                          icon: isFavorited
                              ? const Icon(FontAwesomeIcons.solidBookmark)
                              : const Icon(FontAwesomeIcons.bookmark))
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
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    labelColor: Theme.of(context).colorScheme.primary,
                    isScrollable: true,
                    labelPadding: paddingAllMedium,
                    labelStyle: const TextStyle(fontSize: 20),
                    tabAlignment: TabAlignment.start,
                    tabs: List.generate(2, (index) {
                      if (index == 0) {
                        return const Tab(text: LessonDetailsConstants.content);
                      } else if (index == 1) {
                        return const Tab(text: LessonDetailsConstants.about);
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
                            itemCount: widget.education.videoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  videoUrlNotifier.value =
                                      widget.education.videoList[index].link;
                                  setState(() {
                                    selectedVideoIndex =
                                        index; // Seçili video indeksini güncelleyin
                                  });
                                },
                                child: Card(
                                  // TODO: Renkler alınacak
                                  elevation: 3,
                                  color: selectedVideoIndex == index
                                      ? const Color.fromARGB(255, 202, 198, 198)
                                      : Theme.of(context)
                                          .colorScheme
                                          .background,
                                  child: EducationListTile(
                                      video: widget.education.videoList[index]),
                                ),
                              );
                            },
                          ),
                        ),
                        EducationAbout(
                          education: widget.education,
                        ),
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
