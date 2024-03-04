import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninPageConstants {
  static const String eMailLabelText = "E-posta Adresi";
  static const String passwordLabelText = "Parola";
  static const String signInButtonText = "Giriş Yap";
  static const String signUpButtonText = "Kayıt Ol";
  static const String passwordRequestText = "Parolamı Unuttum";
  static const String passwordReset =
      "Şifre sıfırlama maili gönderildi. Lütfen e-mailinizi kontrol ediniz.";
  static const String enterYourEmail = "Lütfen e-mail adresinizi giriniz";

  static const Icon mailIcon = Icon(Icons.mail);
  static const Icon lockIcon = Icon(Icons.lock);
}

class SignUpPageConstants {
  static const String nameSurnameLabelText = "Ad Soyad";
  static const String eMailLabelText = "E-posta Adresi";
  static const String passwordLabelText = "Parola";
  static const String signUpButtonText = "Kayıt Ol";
  static const String signInButtonText = "Giriş Yap";
  static const Icon personIcon = Icon(Icons.person);
  static const Icon lockIcon = Icon(Icons.lock);
  static const Icon mailIcon = Icon(Icons.mail);
}

class DrawerConstants {
  static const String homePage = "Anasayfa";
  static const String evaluationPage = "Değerlendirmeler";
  static const String profilePage = "Profilim";
  static const String catalogPage = "Katalog";
  static const String calendarPage = "Takvim";
  static const String tobetoCopyright = "© 2022 Tobeto";
  static const String error = "Hata";
}

class ProfileEditPageConstants {
  static const String profile = "Profil";
  static const String experience = "Deneyim";
  static const String education = "Eğitim";
  static const String socialMedia = "Sosyal Medya";
  static const String settings = "Ayarlar";
  static const Icon workIcon = Icon(Icons.work_outline_outlined);
  static const Icon cardTravelIcon = Icon(Icons.card_travel_outlined);
  static const Icon menuBookIcon = Icon(Icons.menu_book_outlined);
  static const Icon facebookIcon = Icon(Icons.facebook_outlined);
  static const Icon settingsIcon = Icon(Icons.settings_outlined);
  static const Icon exitToAppIcon = Icon(Icons.exit_to_app_outlined);
}

class LessonConstants {
  static const String lessons = "Eğitimlerim";
  static const String search = "Arama";
  static const String corporationChoose = "Kurum Seçiniz..";
  static const String choose = "Seçiniz..";
  static final List<String> dropdownSortItems = [
    "Adına göre (A-Z)",
    "Adına göre (Z-A)",
    "Tarihe göre (Y-E)",
    "Tarihe göre (E-Y)"
  ];
  static final List<String> dropdownCorporationItems = ["İstanbul Kodluyor"];
  static const String allLessons = "Tüm Eğitimlerim";
  static const String continuingLessons = "Devam Ettiklerim";
  static const String completedLessons = "Tamamladıklarım";
  static const String lessonsNotFound = "Ders bulunamadı.";
  //icons
  static const Icon rightArrowIcon = Icon(Icons.chevron_right_sharp);
  static const Icon closeIcon = Icon(Icons.close, size: 25, color: Colors.grey);
  static const Icon downArrowIcon =
      Icon(Icons.keyboard_arrow_down, color: Colors.grey);
  static const Icon searchIcon =
      Icon(Icons.search, size: 40, color: Colors.grey);
}

class CatalogConstants {
  static const String filter = "Filtrele";
  static const String learn = "Öğrenmeye";
  static const String start = "başla !";
  static const String searchLesson = "Eğitim Arayın...";
  static const List<String> categoryItems = [
    "Tüm Eğitimler",
    "Ücretli Eğitimler",
    "Ücretsiz Eğitimler"
  ];
  static const List<String> educationItems = [
    "Tüm Eğitimler",
    "Dijital Gelişim",
    "Profesyonel Gelişim"
  ];
  static const List<String> levelItems = [
    "Tüm Seviyeler",
    "Başlangıç",
    "Orta",
    "İleri"
  ];
  static const List<String> subjectItems = [
    "Tüm Konular",
    "C#",
    "Çeşitlilik ve Kapsayıcılık",
    "Başarı ve Sonuç Odaklılık",
    "Takım Bilinci",
    "Etkili İletişim ve İlişki Yönetimi",
    "Karar Verme",
    "Profesyonellik"
  ];
  static const List<String> softwareLangItems = [
    "Tüm Diller",
    "ASPNET",
    "Bootstrap",
    "SASS",
    "JavaScript",
    "JQuery",
    "SQL",
    "AJAX",
    "HTML",
    "CSS",
    "React",
    "Flutter"
  ];
  static const List<String> teacherItems = [
    "Tüm Eğitmenler",
    "Veli Bahçeci",
    "Halit Enes Kalaycı",
    "Gürkan İlişen",
    "Engin Demiroğ",
    "Kader Yavuz"
  ];
  static const List<String> situationItems = [
    "Tüm Eğitimler",
    "Alınan Tüm Eğitimler",
    "Henüz Başlanmamış Eğitimler",
    "Tamamlanan Eğitimler",
    "Devam Eden Eğitimler"
  ];
  static const String category = "Kategori";
  static const String education = "Eğitim";
  static const String level = "Seviye";
  static const String subject = "Konu";
  static const String softwareLanguage = "Yazılım Dili";
  static const String teacher = "Eğitmen";
  static const String situation = "Durum";

  static const IconData accessTime = Icons.access_time;
  static const IconData person = Icons.person_outline_sharp;
  static const Icon videoPlayIcon =
      Icon(Icons.play_circle, size: 40, color: Color(0xFF9933FF));
}

class AnnouncementConstants {
  static const String announcements = "Duyurularım";
  static const String type = "Tür";
  static const String organization = "Organizasyon";
  static const String alignment = "Sıralama";
  static const List<String> dropdownTypeItems = ["Duyuru", "Haber"];
  static const List<String> dropdownCorporationItems = ["İstanbul Kodluyor"];
  static const List<String> dropdownSortItems = [
    "Tarihe göre (Y-E)",
    "Tarihe göre (E-Y)"
  ];
  static const String visible = "Visible";
  static const String invisible = "Invisible";
  static const String announcement = "Duyuru";
  static const String news = "Haber";
  static const String istanbulCodingText = "İstanbul Kodluyor";
  static const String readMore = "Devamını oku";
  static const String announcementNotFound = "Duyuru Bulunamadı.";

  static const IconData calendarIcon = Icons.calendar_month_outlined;
}

class ApplicationConstants {
  static const String information = "Bilgilendirme";
  static const String applicationFormText =
      "İstanbul Kodluyor Başvuru Formu onaylandı";
  static const String applicationDocumentText =
      "İstanbul Kodluyor Belge Yükleme Formu onaylandı.";
  static const String accepted = "Kabul Edildi";
  static const Icon checkIcon = Icon(Icons.check, color: Color(0xFF076B34));
}

class WorkExperienceConstants {
  static const String defaultError = "Kullanıcı bilgileri alınamadı.";
  static const String workPageTitle = "Deneyim Bilgileri";
  static const String workExperienceNotFound = "İş Deneyimi Bulunamadı.";
  static const String workCompanyName = "Kurum Adı";
  static const String workPosition = "Pozisyon";
  static const String workSector = "Sektör";
  static const String workCity = "Şehir";
  static const String workExplain = "Deneyim Açıklaması";
  static const String dialogClose = "Kapat";

  static const Icon workInfoIcon = Icon(Icons.info_outlined);
  static const Icon calendarIcon = Icon(Icons.calendar_month_outlined);

  static const textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const textStyleGrey = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF828282));
}

class SocialMediaConstants {
  static const String socialMediaTitle = "Sosyal Medya Bilgileri";
  static const String socialMediaNotFound = "Sosyal medya bilgisi yok";

  static const Icon facebookIcon = Icon(
    FontAwesomeIcons.facebook,
    size: 50.0,
    color: Color(0xFF9933FF),
  );

  static const Icon twitterIcon = Icon(
    FontAwesomeIcons.twitter,
    size: 50.0,
    color: Color(0xFF9933FF),
  );

  static const Icon instagramIcon = Icon(
    FontAwesomeIcons.instagram,
    size: 50.0,
    color: Color(0xFF9933FF),
  );
}

class ProfileInformationConstants {
  static const String emptyPhoto = "Fotoğraf yükle";
  static const String nameSurname = "Ad Soyad";
  static const String birthDate = "Doğum Tarihi";
  static const String email = "E-posta Adresi";
  static const String phone = "Telefon Numarası";

  static const IconData personIcon = Icons.person_outlined;
  static const IconData calendarIcon = Icons.calendar_month_outlined;
  static const IconData emailIcon = Icons.email_outlined;
  static const IconData phoneIcon = Icons.phone_outlined;
}

class EducationPageConstants {
  static const String educationPageTitle = "Eğitim Bilgileri";
  static const String userNotFound = "Kullanıcı bilgileri alınamadı.";
  static const String educationNotFound = "Eğitim Bilgisi Bulunamadı.";
  static const String educationSchoolName = "Okul Adı";
  static const String educationDepartment = "Bölüm";
  static const String educationStatus = "Eğitim Durumu";

  static const Icon calendarIcon = Icon(Icons.calendar_month_outlined);

  static const textStyleGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF828282),
  );

  static const textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

class AboutMeConstants {
  static const String aboutMeTitle = "Hakkımda";
  static const String aboutMeNotFound = "Hakkımda bilgisi yok";

  static const textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}

class SocialMediaEditConstants {
  static const String dropdownFacebook = "Facebook";
  static const String dropdownTwitter = "Twitter";
  static const String dropdownInstagram = "Instagram";
  static const String dropdownHint = "Sosyal Medya Türü";
  static const String textfieldTitle = "Sosyal Medya*";
  static const String textfieldHint = "Sosyal medya hesabı giriniz";
  static const String saveButton = "Kaydet";
  static const String error = "Lütfen sosyal medya türü seçiniz.";
}

class SettingsPageConstants {
  static const String deleteAccount = "Üyeliği Sil";
}

class ExperienceConstants {
  static const String company = "Kurum Adı";
  static const String companyHint = "Kurum Adı Giriniz";
  static const String position = "Pozisyon";
  static const String positionHint = "Pozisyon Giriniz";
  static const String sector = "Sektör";
  static const String sectorHint = "Sektör Giriniz";
  static const String city = "Şehir";
  static const String cityHint = "Şehir Giriniz";
  static const String startDate = "Başlangıç Tarihi";
  static const String startDateHint = "Başlangıç Tarihi Giriniz";
  static const String endDate = "Bitiş Tarihi";
  static const String endDateHint = "Bitiş Tarihi Giriniz";
  static const String description = "Açıklama";
  static const String descriptionHint = "Açıklama Giriniz";
  static const String saveButton = "Kaydet";
}

class ProfileEditConstants {
  static const String photoUpload = "Fotoğrafı Değiştir";
  static const String nameSurname = "Adınız Soyadınız*";
  static const String nameSurnameHint = "Adınız Soyadınızı Giriniz";
  static const String phone = "Telefon Numaranız*";
  static const String phoneHint = "Telefon Numaranızı Giriniz";
  static const String birthDate = "Doğum Tarihiniz*";
  static const String birthDateHint = "Doğum tarihinizi giriniz(23/07/1996)";
  static const String identityNumber = "Kimlik Numaranız*";
  static const String identityNumberHint = "Kimlik Numaranızı Giriniz";
  static const String email = "E-posta Adresiniz*";
  static const String emailHint = "E-posta Adresinizi Giriniz";
  static const String country = "Ülkeniz*";
  static const String countryHint = "Ülkenizi Giriniz";
  static const String city = "Şehriniz*";
  static const String cityHint = "Şehrinizi Giriniz";
  static const String district = "İlçeniz*";
  static const String districtHint = "İlçenizi Giriniz";
  static const String address = "Adresiniz*";
  static const String addressHint = "Adresinizi Giriniz";
  static const String aboutMe = "Hakkınızda";
  static const String aboutMeHint = "Hakkınızda Metnini Giriniz";
  static const String saveButton = "Kaydet";
  static const String featureUnavailable = "Bu özellik şu anda kullanılamıyor";
  static const String education = "Eğitim Durumu*";
  static const String educationHint = "Eğitim Durumu Giriniz";
  static const String schoolName = "Okul Adı*";
  static const String schoolNameHint = "Okul Adı Giriniz";
  static const String department = "Bölüm*";
  static const String departmentHint = "Bölüm Giriniz";
  static const String startDate = "Başlangıç Tarihi*";
  static const String startDateHint = "Başlangıç Tarihi Giriniz";
  static const String endDate = "Bitiş Tarihi*";
  static const String endDateHint = "Bitiş Tarihi Giriniz";
}

class ProfilePageConstants {
  static const Icon editIcon = Icon(Icons.edit);
  static const Icon shareIcon = Icon(Icons.share);
}

class LessonDetailsConstants {
  static const String content = "İçerik";
  static const String about = "Hakkında";
  static const String lessonLiked = "Ders Beğenildi";
  static const String lessonDisliked = "Beğeniden Çıkarıldı";
  static const String lessonAddFavorites = "Favoriye Eklendi";
  static const String lessonRemovedToFavorites = "Favorilerden Çıkarıldı";
  static const String startDate = "Başlangıç:";
  static const String endDate = "Bitiş:";
  static const String spendTime = "Geçirdiğin Süre:";
  static const String estimatedTime = "Tahmini Süre:";
  static const String category = "Kategori:";
  static const String teacher = "Eğitimci:";
  static const String videoCount = "Video Sayısı:";
  static const String hour = " saat";
  static const String minute = " dakika";
  static const IconData calendarIcon = Icons.calendar_month;
  static const IconData watchIcon = Icons.watch_later_outlined;
  static const IconData categoryIcon = Icons.category;
  static const IconData personIcon = Icons.person;
  static const IconData languageIcon = Icons.language;
}

class EvaluationConstants {
  static const String pageTitle =
      "Yetkinliklerini ücretsiz ölç, bilgilerini test et.";
  static const String successModelText = "Tobeto İşte Başarı Modeli";
  static const String successModelSubtitle =
      "80 soru ile yetkinliklerini ölç,\nönerilen eğitimleri tamamla,\nrozetini kazan.";
  static const String successTestTitle = "Yazılımda Başarı Testi";
  static const String successTestSubtitle =
      "Çoktan seçmeli sorular\nile teknik bilgini test et.\n\n>>>\n";

  static const String subscriptionExclusive = "Aboneliğe özel";
  static const String evaluation = " değerlendirme";
  static const String forTools = "araçları için";
  static const String pageTitle2 = "Kazanım Odaklı Testler";
  static const String subtitle =
      "Dijital gelişim kategorisindeki eğitimlere başlamadan\nönce konuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.\n";
  static const String huawieTitle =
      "Huawei Talent Interview\nTeknik Bilgi Sınavı*";
  static const String huawieSubtitle =
      "Sertifika alabilmen için, eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür.\n\n4400+ soru | 30+ \nprogramlama dili\n4 zorluk seviyesi";
  static const String huawieSubtitle2 =
      "*Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.";
  static const String start = "Başla";
  static const String viewReport = "Raporu Görüntüle";
  static const String dialogTitleFrontEnd = "Front End";
  static const String dialogTitleFullStack = "Full Stack";
  static const String dialogTitleBackEnd = "Back End";
  static const String dialogTitleMSQLServer = "Microsoft SQL Server";
  static const String dialogTitleMasaustuProgramlama = "Masaüstü Programlama";

  static const Icon menuIcon = Icon(Icons.menu, color: Colors.white);
}

class EducationListTileConstants {
  static const String completed = "Completed";
  static const String inProgress = "In Progress";
  static const String duration = " dk";
  static const Icon checkCircleIcon = Icon(Icons.check_circle);
  static const Icon accessTimeFilledIcon = Icon(Icons.access_time_filled_sharp);
  static const Icon playArrowIcon = Icon(Icons.play_arrow);
}

class HeaderConstants {
  static const String tobeto = "TOBETO";
  static const String welcome = "'ya hoş geldin\n";
  static const String newGenerationLearningExperience =
      "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!";
  static const String freeEducationForFuture =
      "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.";
  static const String lookingFor = 'Aradığın ';
  static const String quotationMarks = '"';
  static const String job = 'İş';
  static const String hear = ' burada!';
}

class TabbarConstants {
  static const String applications = "Başvurularım";
  static const String educations = "Eğitimlerim";
  static const String announcements = "Duyuru ve Haberlerim";
  static const String surveys = "Anketlerim";
  static const String surveyNotFound =
      "Atanmış herhangi bir anketiniz bulunmamaktadır";
}

class FooterConstants {
  static const String contactUs = "Bize Ulaşın";
  static const String tobeto = "© 2022 Tobeto";
}

class CustomCircleAvatarConstants {
  static const String defaultPhotoUrl =
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
}

class ChatBotConstants {
  static const String chatBotTitle = "TobetoAI";
  static const String chatBotDiscussion = 'TobetoAI Sohbet';
  static const String studentTitle = "Öğrenci";
  static const String message = "prompt";
  static const String response = "response";
  static const String timestamp = "timestamp";
  static const String defaultPhotoUrl =
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
  static const String discussionList = 'Sohbet Listesi';
  static const String enterYourFirstMessage = "İlk mesajınızı yazın";
  static const String enterYourMessage = "Mesajınızı yazın";
  static const String createNewDiscussion = 'Yeni Bir Sohbet Oluştur';
  static const IconData deleteIcon = Icons.delete;
  static const Icon arrowBackIcon = Icon(Icons.arrow_back);
  static const Icon sendMessageIcon = Icon(Icons.send);
}

class ExamConstants {
  static const String title =
      "\nBu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır.\n\nSınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız taktirde çözdüğünüz kısım kadarıyla değerlendirileceksiniz.";
  static const String exams = "Sınavlarım";
  static const String evaluationExam =
      "Herkes için Kodlama 1D Değerlendirme Sınavı";
  static const String codingForEveryone = "Herkes için Kodlama - 1D";
  static const String lessonMinute45 = "45 Dakika";
  static const String lessonMinute = "Dakika";
  static const String multibleChoice = "Çoktan Seçmeli";
  static const String examTime = "Sınav Süresi: ";
  static const String questionItem = "Soru Sayısı: ";
  static const String examType = "Soru Tipi: ";
  static const String examFinish = "Test Bitti";
  static const String correctAnswer = 'Doğru';
  static const String wrongAnswer = 'Yanlış';
  static const String emptyAnswer = "Boş";
  static const String point = "Puan";
  static const String nextQuestion = "Diğer Soru";
  static const String dialogText =
      " Sevgili Adayımız, \n\nHerkes için Kodlama Eğitimi'ni tamamladığınız için tebrik ederiz. Bu eğitim sonrası bir sonraki aşamaya geçiş için 25 sorudan oluşan bir değerlendirme sınavımız bulunmaktadır. \n\nBu test her kullanıcı için sadece 1 kez sunulmakta olup 45 dakika içinde tamamlanması gerekmektedir. \n\nTüm değerlendirme kriterleri sonrası Mesleki Gelişim Eğitimlerine geçişiniz ile ilgili bilgilendirileceksiniz. \n\nSevgiler, \nTOBETO";
  static const String timeIsUp = "Süre doldu";
  static const Icon checkIcon =
      Icon(Icons.check, color: Colors.white, size: 25);
}

class HomePageConstants {
  static const String createProfile = "Profilini oluştur";
  static const String evaluateYourself = "Kendini Değerlendir";
  static const String startLearning = "Öğrenmeye başla";
}

class Page404Constants {
  static const String pageNotFound = "Sayfa Bulunamadı. 404 Hatası!";
  static const String goToLoginScreen = "Giriş Ekranına Git";
}
