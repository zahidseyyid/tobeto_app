import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_bloc.dart';
import 'package:flutter_application_1/logic/blocs/announcement/announcement_state.dart';
import 'package:flutter_application_1/models/announcements_model.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget/announcement_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnnouncementItemWidget extends StatefulWidget {
  const AnnouncementItemWidget({super.key});

  @override
  State<AnnouncementItemWidget> createState() => _AnnouncementItemWidgetState();
}

class _AnnouncementItemWidgetState extends State<AnnouncementItemWidget> {
  late List<AnnouncementModel> filtering;
  void sortAnnouncements(List<AnnouncementModel> list, String sortData) {
    switch (sortData) {
      case AnnouncementConstants.announcement:
        filtering = list.where((element) => element.isAnnouncement).toList();
        break;
      case AnnouncementConstants.news:
        filtering = list.where((element) => !(element.isAnnouncement)).toList();
        break;
      case "Invisible": //Okunanlar görünmeyecek
        filtering = list.where((element) => !(element.isRead)).toList();
      case "Tarihe göre (Y-E)":
        list.sort((a, b) => b.date.compareTo(a.date));
        break;
      case "Tarihe göre (E-Y)":
        list.sort((a, b) => a.date.compareTo(b.date));
        break;
      default:
        //"Adına göre alfabetik sırayla (A-Z)"
        list.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  List<AnnouncementModel> filterAnnouncements(
      List<AnnouncementModel> anouncements, String pattern) {
    return anouncements
        .where((element) => element.title.toLowerCase().contains(pattern))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final lessonBlocState = context.watch<AnnouncementBloc>().state;
    List<AnnouncementModel> announcementList;

    if (lessonBlocState is AnnouncementLoaded) {
      announcementList = lessonBlocState.announcementList;
      filtering = filterAnnouncements(
        announcementList,
        Provider.of<StateData>(context, listen: true).pattern,
      );
      //Neye göre sıralayacağımı tuttuğum global stateden çektim
      String sortData = Provider.of<StateData>(context, listen: true).sort;

      sortAnnouncements(
          filtering, sortData); //Dropdown menüden seçilene göre sıralama
      return ListView.builder(
          itemCount: filtering.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: paddingAllMedium,
          itemBuilder: (context, index) {
            return Card(
              margin: paddingOnlyBottomSuperBig,
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
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: const Border(
                            left: BorderSide(
                                color: Color(0xFF076B34), width: 10)),
                      ),
                      padding: paddingAllSuperBig,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  filtering[index].isAnnouncement
                                      ? AnnouncementConstants.announcement
                                      : AnnouncementConstants.news,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF076B34),
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                AnnouncementConstants.istanbulCodingText,
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
                              child: Text(filtering[index].title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5)),
                                  const SizedBox(width: 5),
                                  Text(
                                      DateFormat('dd-MM-yyyy')
                                          .format(filtering[index].date)
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
                                  if (filtering[index].isRead == false) {
                                    //eğer mesaj okunmamış ise tıklandığında bildirimden 1 azalacak
                                    Provider.of<StateData>(context,
                                            listen: false)
                                        .countAnnouncement();
                                    filtering[index].isRead = true;
                                  }
                                  announcementDialogWidget(
                                      context,
                                      filtering[index].title,
                                      filtering[index]
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
            );
          });
    } else {
      return const Text(AnnouncementConstants.announcementNotFound);
    }
  }
}
