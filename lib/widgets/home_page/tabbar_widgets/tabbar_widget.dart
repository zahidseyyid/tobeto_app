import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_image.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/announcement/announcement_bloc.dart';
import 'package:tobeto_app/logic/blocs/announcement/announcement_event.dart';
import 'package:tobeto_app/logic/blocs/announcement/announcement_state.dart';
import 'package:tobeto_app/logic/blocs/lesson/lesson_bloc.dart';
import 'package:tobeto_app/logic/blocs/lesson/lesson_event.dart';
import 'package:tobeto_app/utils/error_toast.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/announcements_widget.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/applications_widget.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circular_progress.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/lessons_widget.dart';
import 'package:tobeto_app/widgets/home_page/tabbar_widgets/surveys_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatefulWidget {
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
  void initState() {
    context.read<AnnouncementBloc>().add(AnnouncementReset());
    context.read<LessonBloc>().add(ResetFetchLessons());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    int unReadAnnouncement =
        Provider.of<StateData>(context, listen: true).unReadAnnouncement;
    // TODO: Renk temadan alınacak
    const TextSpan textSpan = TextSpan(
      text: HeaderConstants.quotationMarks,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00D29B),
      ),
    );
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if (state is AnnouncementInitial) {
          context.read<AnnouncementBloc>().add(FetchAnnouncements(
              userAnnouncementList: widget.userAnnouncementList));
          return const Center(
            child: CustomCircularProgress(),
          );
        } else if (state is AnnouncementLoading) {
          return const Center(
            child: CustomCircularProgress(),
          );
        } else if (state is AnnouncementError) {
          ToastHelper.showErrorToast(state.errorMessage);
        } else if (state is AnnouncementLoaded) {
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
                Padding(
                  padding: paddingMedium,
                  child: const Text(
                    HeaderConstants.freeEducationForFuture,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text.rich(
                  //Tırnak işaretli yeşil kısım
                  TextSpan(
                    text: HeaderConstants.lookingFor,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      textSpan,
                      TextSpan(text: HeaderConstants.job),
                      textSpan,
                      TextSpan(text: HeaderConstants.hear),
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
                        labelPadding: paddingAllSmall,
                        tabAlignment: TabAlignment.start,
                        tabs: List.generate(4, (index) {
                          if (index == 0) {
                            return const Tab(
                                text: TabbarConstants.applications);
                          } else if (index == 1) {
                            return const Tab(text: TabbarConstants.educations);
                          } else if (index == 2) {
                            if (unReadAnnouncement == 0) {
                              return const Tab(
                                  text: TabbarConstants.announcements);
                            } else {
                              //kırmızı bildirim kısmı
                              return Badge(
                                label: Text(
                                  unReadAnnouncement.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                //TODO:rengi temadan alınacak
                                backgroundColor: Colors.red[400],
                                child: const Tab(
                                    text: TabbarConstants.announcements),
                              );
                            }
                          } else if (index == 3) {
                            return const Tab(text: TabbarConstants.surveys);
                          }
                          return const Tab(text: "");
                        }),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.27,
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
                            const SurveysWidget(TabbarConstants.surveyNotFound),
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
