import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_event.dart';
import 'package:flutter_application_1/api/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/pages/announcements_page.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget/announcement_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnnouncementsWidget extends StatelessWidget {
  const AnnouncementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
        builder: (context, state) {
          if (state is AnnouncementInitial) {
            context.read<AnnouncementBloc>().add(FetchAnnouncements());
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
            if (state.announcementList.isNotEmpty) {
              return ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 2) {
                      return IconButton(
                        //Daha fazla göster butonu
                        icon: const Icon(Icons.chevron_right_sharp),
                        iconSize: 35,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnnouncementsPage(),
                            ),
                          );
                        },
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, bottom: 20),
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
                                  padding: const EdgeInsets.all(20),
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
                                                  ? "Duyuru"
                                                  : "Haber",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF076B34),
                                                  fontWeight: FontWeight.bold)),
                                          const Text(
                                            "İstanbul Kodluyor",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF076B34),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 10),
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
                                                  Icons.calendar_month_outlined,
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
                                              "Devamını oku",
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
              return const Text("No announcement found.");
            }
          }
          return const Text("No announcement found.");
        },
      ),
    );
  }
}
