import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String id;
  String image;
  String title;
  String teacher;
  int progress;
  DateTime startDate;
  DateTime endDate;
  Duration spentTime;
  Duration estimatedTime;
  String category;
  String fetchCategory;
  int videoCount;
  List<Video> videoList;

  Education({
    required this.id,
    required this.image,
    required this.title,
    required this.teacher,
    required this.progress,
    required this.startDate,
    required this.endDate,
    required this.spentTime,
    required this.estimatedTime,
    required this.category,
    required this.fetchCategory,
    required this.videoCount,
    required this.videoList,
  });
  factory Education.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return Education(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      teacher: map['teacher'] ?? '',
      progress: map['progress']?.toInt() ?? 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(map[
          'startDate']), // millisecondsSinceEpoch ile tamsayıdan DateTime'e dönüştürüyoruz
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      spentTime: Duration(
          milliseconds: map[
              'spentTime']), // Duration'u inMilliseconds ile tamsayıdan oluşturuyoruz
      estimatedTime: Duration(milliseconds: map['estimatedTime']),
      category: map['category'] ?? '',
      videoCount: map['videoCount']?.toInt() ?? 0,
      videoList:
          List<Video>.from(map['videoList']?.map((x) => Video.fromMap(x))),
      fetchCategory: 'fetchCategory',
    );
  }
}

class Video {
  int id;
  String videoTitle;
  String link;
  Duration duration;
  String status;

  Video({
    required this.id,
    required this.videoTitle,
    required this.link,
    required this.duration,
    required this.status,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoTitle': videoTitle,
      'link': link,
      'duration': duration.inMilliseconds,
      'status': status,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] ?? 0,
      videoTitle: map['videoTitle'] ?? '',
      link: map['link'] ?? '',
      duration: Duration(milliseconds: map['duration'] ?? 0),
      status: map['status'] ?? '',
    );
  }
}
