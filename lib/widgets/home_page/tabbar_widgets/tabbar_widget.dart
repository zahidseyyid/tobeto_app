import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_event.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/applications_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessons_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/surveys_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatefulWidget {
  //TODO: Text ve iconlar constant olmalı
  const TabBarWidget(
      {super.key,
      required this.lessonList,
      required this.userAnnouncementList});
  final List<String> lessonList;
  final List<String> userAnnouncementList;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    int unReadAnnouncement =
        Provider.of<StateData>(context, listen: true).unReadAnnouncement;
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if (state is AnnouncementInitial) {
          context.read<AnnouncementBloc>().add(FetchAnnouncements(
              userAnnouncementList: widget.userAnnouncementList));
          return const Center(
            child: Text("İstek atılıyor.."),
          );
        }
        if (state is AnnouncementLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AnnouncementError) {
          return const Center(
            child: Text("İstek hatalı.."),
          );
        }
        if (state is AnnouncementLoaded) {
          unReadAnnouncement = state.announcementList
              .where((element) => !(element.isRead))
              .toList()
              .length;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                    width: deviceWidth * 0.6,
                    child: Image.asset(PageImageConstants.istanbulCoding),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text.rich(
                  //Tırnak işaretli yeşil kısım
                  TextSpan(
                    text: 'Aradığın ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '"',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00D29B),
                        ),
                      ),
                      TextSpan(text: 'İş'),
                      TextSpan(
                        text: '"',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00D29B),
                        ),
                      ),
                      TextSpan(text: ' burada!'),
                    ],
                  ),
                ),
                //Tabbar kod başlangıcı
                DefaultTabController(
                  length: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        labelColor: Theme.of(context).colorScheme.primary,
                        isScrollable: true,
                        labelPadding: const EdgeInsets.all(5),
                        tabAlignment: TabAlignment.start,
                        tabs: List.generate(4, (index) {
                          if (index == 0) {
                            return const Tab(text: "Başvurularım");
                          } else if (index == 1) {
                            return const Tab(text: "Eğitimlerim");
                          } else if (index == 2) {
                            if (unReadAnnouncement == 0) {
                              return const Tab(text: "Duyuru ve Haberlerim");
                            } else {
                              //kırmızı bildirim kısmı
                              return Badge(
                                label: Text(
                                  unReadAnnouncement.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.red[400],
                                child: const Tab(text: "Duyuru ve Haberlerim"),
                              );
                            }
                          } else if (index == 3) {
                            return const Tab(text: "Anketlerim");
                          }
                          return const Tab(text: "");
                        }),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.24,
                        child: TabBarView(
                          children: [
                            ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                ApplicationsWidget(),
                                ApplicationsWidget(),
                              ],
                            ),
                            LessonsWidget(
                              lessonList: widget.lessonList,
                            ),
                            AnnouncementsWidget(
                                userAnnouncementList:
                                    widget.userAnnouncementList),
                            const SurveysWidget(
                                text:
                                    "Atanmış herhangi bir anketiniz bulunmamaktadır"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Text("No announcement found.");
      },
    );
  }
}
