import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  static const String socialMediaNotFound = "Sosyal medya bilgsi yok";

  static const Icon facebookIcon = Icon(
    FontAwesomeIcons.facebook,
    size: 50.0,
  );

  static const Icon twitterIcon = Icon(
    FontAwesomeIcons.twitter,
    size: 50.0,
  );

  static const Icon instagramIcon = Icon(
    FontAwesomeIcons.instagram,
    size: 50.0,
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
}
