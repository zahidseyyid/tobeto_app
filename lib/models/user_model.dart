import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user_profile_model/education_history.dart';
import 'package:flutter_application_1/models/user_profile_model/social_media_account.dart';
import 'package:flutter_application_1/models/user_profile_model/work_history.dart';

class UserProfile {
  String uid;
  String? profilePictureUrl;
  String nameSurname;
  String email;
  String? idNo;
  String? phone;
  String? birthDate;
  String? country;
  String? city;
  String? district;
  String? address;
  String? about;
  List<EducationHistory>? educationHistory;
  List<WorkHistory>? workHistory;
  List<SocialMedia>? socialMedia;

  UserProfile({
    required this.uid,
    this.profilePictureUrl,
    required this.nameSurname,
    required this.email,
    this.idNo,
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

  factory UserProfile.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic>? json = document.data() as Map<String, dynamic>?;

    json ??= {};

    return UserProfile(
      uid: json['uid'],
      profilePictureUrl: json['profilePictureUrl'],
      nameSurname: json['nameSurname'],
      email: json['email'],
      idNo: json['idNo'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      country: json['country'],
      city: json['city'],
      district: json['district'],
      address: json['address'],
      about: json['about'],
      educationHistory: (json['educationHistory'] as List<dynamic>?)
          ?.map(
              (e) => EducationHistory.fromFirestore(e as Map<String, dynamic>))
          .toList(),
      workHistory: (json['workHistory'] as List<dynamic>?)
          ?.map((e) => WorkHistory.fromFirestore(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['socialMedia'] as List<dynamic>?)
          ?.map((e) => SocialMedia.fromFirestore(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'profilePictureUrl': profilePictureUrl ?? "",
      'nameSurname': nameSurname,
      'email': email,
      'idNo': idNo ?? "",
      'phone': phone ?? "",
      'birthDate': birthDate?.toString() ?? "",
      'country': country ?? "",
      'city': city ?? "",
      'district': district ?? "",
      'address': address ?? "",
      'about': about ?? "",
      'educationHistory':
          educationHistory?.map((e) => e.toFirestore()).toList() ?? {},
      'workHistory': workHistory?.map((e) => e.toFirestore()).toList() ?? {},
      'socialMedia': socialMedia?.map((e) => e.toFirestore()).toList() ?? {},
    };
  }
}
