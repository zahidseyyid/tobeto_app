import 'package:flutter/material.dart';

class SigninPageConstants {
  static const String eMailLabelText = "E-posta Adresi";
  static const String passwordLabelText = "Parola";
  static const String signInButtonText = "Giriş Yap";
  static const String signUpButtonText = "Kayıt Ol";
  static const String passwordRequestText = "Parolamı Unuttum";
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

  static const Icon videoPlayIcon =
      Icon(Icons.play_circle, size: 40, color: Color(0xFF9933FF));
}

class AnnouncementConstants {
  static const String announcements = "Duyurularım";
  static const String type = "Tür";
  static const String organization = "Organizasyon";
  static const String alignment = "Sıralama";
  static const List<String> dropdownTypeItems = [
    "Duyuru",
    "Haber",
  ];
  static const List<String> dropdownCorporationItems = [
    "İstanbul Kodluyor",
  ];
  static const List<String> dropdownSortItems = [
    "Tarihe göre (Y-E)",
    "Tarihe göre (E-Y)",
  ];

  static const String announcement = "Duyuru";
  static const String news = "Haber";
  static const String istanbulCodingText = "İstanbul Kodluyor";
  static const String readMore = "Devamını oku";
  static const String announcementNotFound = "Duyuru Bulunamadı.";
}
