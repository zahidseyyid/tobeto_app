import 'package:flutter_application_1/models/announcements_model.dart';

List<AnnouncementModel> announcementsData = [
  AnnouncementModel(
    id: "1",
    title: "Yeni Gelenler için Bilgilendirme",
    text: "Sevgili İstanbul Kodluyor'lu,\n\n",
    isAnnouncement: true,
    date: DateTime(2023, 11, 17),
  ),
  AnnouncementModel(
    id: "2",
    title: "4 Aralık Online Hoşgeldin Buluşması",
    text:
        "Sevgili İstanbul Kodluyor'lu,\n\n 4 Aralık Pazartesi günü saat 11.00'de aramıza yeni katılanlar adaylar ile online olarak bir araya geleceğimiz için heyecanlıyız. \n\n",
    isAnnouncement: true,
    date: DateTime(2023, 11, 29),
  )
];
