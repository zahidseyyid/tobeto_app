import 'package:flutter_application_1/models/user_profile_model/education_history.dart';
import 'package:flutter_application_1/models/user_profile_model/social_media_account.dart';
import 'package:flutter_application_1/models/user_profile_model/work_history.dart';

class UserProfile {
  String? idNo;
  String? profilePictureUrl;
  String name;
  String surname;
  String? email;
  String? phone;
  DateTime? birthDate;
  String? country;
  String? city;
  String? district;
  String? address;
  String? about;
  List<EducationHistory>? educationHistory;
  List<WorkHistory>? workHistory;
  List<SocialMedia>? socialMedia;

  UserProfile({
    this.idNo,
    this.profilePictureUrl,
    required this.name,
    required this.surname,
    this.email,
    this.phone,
    this.birthDate,
    this.country,
    this.city,
    this.district,
    this.address,
    this.about,
    this.educationHistory,
    this.workHistory,
    this.socialMedia,
  });

  factory UserProfile.fromFirestore(Map<String, dynamic> json) {
    return UserProfile(
      idNo: json['idNo'],
      profilePictureUrl: json['profilePictureUrl'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phone: json['phone'],
      birthDate:
          json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      country: json['country'],
      city: json['city'],
      district: json['district'],
      address: json['address'],
      about: json['about'],
      educationHistory: (json['educationHistory'] as List?)
          ?.map((e) => EducationHistory.fromFirestore(e))
          .toList(),
      workHistory: (json['workHistory'] as List?)
          ?.map((e) => WorkHistory.fromFirestore(e))
          .toList(),
      socialMedia: (json['socialMedia'] as List?)
          ?.map((e) => SocialMedia.fromFirestore(e))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idNo': idNo,
      'profilePictureUrl': profilePictureUrl,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'birthDate': birthDate?.toString(),
      'country': country,
      'city': city,
      'district': district,
      'address': address,
      'about': about,
      'educationHistory':
          educationHistory?.map((e) => e.toFirestore()).toList(),
      'workHistory': workHistory?.map((e) => e.toFirestore()).toList(),
      'socialMedia': socialMedia?.map((e) => e.toFirestore()).toList(),
    };
  }
}
