import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_event.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget/announcement_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/surveys_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnnouncementsWidget extends StatelessWidget {
  final List<String> userAnnouncementList;
  const AnnouncementsWidget({super.key, required this.userAnnouncementList});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
        builder: (context, state) {
          if (state is AnnouncementInitial) {
            context.read<AnnouncementBloc>().add(
                FetchAnnouncements(userAnnouncementList: userAnnouncementList));
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnnouncementLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnnouncementError) {
            ToastHelper.showErrorToast(state.errorMessage);
          } else if (state is AnnouncementLoaded) {
            if (state.announcementList.isNotEmpty) {
              final itemCounter = state.announcementList.length < 2
                  ? state.announcementList.length
                  : 2;
              return ListView.builder(
                  itemCount: itemCounter + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == itemCounter) {
                      return IconButton(
                        //Daha fazla göster butonu
                        icon: LessonConstants.rightArrowIcon,
                        iconSize: 35,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, "/annonuncement");
                        },
                      );
                    } else {
                      return Padding(
                        padding: paddingSuperBig + paddingHSmall,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Color(0xFF076B34),
                                            width: 10)),
                                  ),
                                  padding: paddingAllSuperBig,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              (state.announcementList[index]
                                                          .isAnnouncement ==
                                                      true)
                                                  ? AnnouncementConstants
                                                      .announcement
                                                  : AnnouncementConstants.news,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF076B34),
                                                  fontWeight: FontWeight.bold)),
                                          const Text(
                                            AnnouncementConstants
                                                .istanbulCodingText,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF076B34),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: paddingMedium,
                                        child: SizedBox(
                                          child: Text(
                                              state.announcementList[index]
                                                  .title,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                  AnnouncementConstants
                                                      .calendarIcon,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.5)),
                                              const SizedBox(width: 5),
                                              Text(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(state
                                                          .announcementList[
                                                              index]
                                                          .date)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ))
                                            ],
                                          ),
                                          InkWell(
                                            child: Text(
                                              AnnouncementConstants.readMore,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                            ),
                                            onTap: () {
                                              if (state.announcementList[index]
                                                      .isRead ==
                                                  false) {
                                                //eğer mesaj okunmamış ise tıklandığında bildirimden 1 azalacak
                                                Provider.of<StateData>(context,
                                                        listen: false)
                                                    .countAnnouncement();
                                                state.announcementList[index]
                                                    .isRead = true;
                                              }
                                              announcementDialogWidget(
                                                  context,
                                                  state.announcementList[index]
                                                      .title,
                                                  state.announcementList[index]
                                                      .text
                                                      .replaceAll('\\n', '\n'));
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
                        ),
                      );
                    }
                  });
            } else {
              return const SurveysWidget(
                text: AnnouncementConstants.announcementNotFound,
              );
            }
          }
          return const Text(AnnouncementConstants.announcementNotFound);
        },
      ),
    );
  }
}
