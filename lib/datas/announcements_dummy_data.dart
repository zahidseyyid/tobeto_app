import 'package:flutter_application_1/models/announcements_model.dart';

List<AnnouncementModel> announcementsData = [
  AnnouncementModel(
    id: "1",
    title: "Yeni Gelenler için Bilgilendirme",
    text: "Sevgili İstanbul Kodluyor'lu,\n\nAramıza hoşgeldin.\n\nHer yeni katılan grubun belli tarihlerde başlangıç zamanı oluyor. Sıradaki grubumuz 4 Aralık'ta başlayacak.\n" +
        "'Online Hoşgeldin Buluşması 4'  ile tüm süreci anlatacağız. 4 Aralık tarihine kadar yapman gereken birşey bulunmuyor.\n\n" +
        "Senden önceki gruplar şu an farklı aşamalarda olduğu için kafa karışıklığı yaşaman normal, tüm aşamaları anlatacağız merak etme :) \n\n" +
        "4 Aralık saat 11.00'de seninle online olarak tanışmak için sabırsızlanıyoruz. \n\n\nSevgiler,\nTOBETO Ekibi ",
    isAnnouncement: true,
    isRead: false,
    date: DateTime(2023, 11, 17),
  ),
  AnnouncementModel(
    id: "2",
    title: "4 Aralık Online Hoşgeldin Buluşması",
    text: "Sevgili İstanbul Kodluyor'lu,\n\n4 Aralık Pazartesi günü saat 11.00'de aramıza yeni katılanlar adaylar ile online olarak bir araya geleceğimiz için heyecanlıyız. \n\n" +
        "İlk etapta tüm süreci birlikte konuşup, neler yapmanız gerektiğini adım adım anlatacağız. Eğitimlerim  bölümündeki size tanımlanmış videoları izleyebilirsiniz. " +
        "Eğitime Git  butonuna tıklayarak online oturumların saatini ve içeriğini görebilirsiniz. Online oturumlara saati geldiğinde ilgili yerden tıklayarak katılabilirsiniz." +
        "Ayrıca bir mail gönderilmeyecektir. Hoşgeldin Buluşması-4 etkinliğine katılımınızı bekliyoruz. Platformu takip etmek adayların sorumluluğundadır.\n\n\nSevgiler,\nTOBETO Ekibi ",
    isAnnouncement: false,
    isRead: false,
    date: DateTime(2023, 11, 29),
  )
];
