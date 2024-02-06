class Education {
  String id;
  String image;
  String title;
  String teacher;
  int progress;
  DateTime startDate; // Eklenme tarihi ile aynı beyza sendeki Datetime time olan kısım için kullanabilirsin
  DateTime endDate;
  Duration spentTime;
  Duration estimatedTime; // lessonDuration ile aynı beyza sendeki lessonDuration olan kısım için kullanabilirsin
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'teacher': teacher});
    result.addAll({'progress': progress});
    result.addAll({
      'startDate': startDate.millisecondsSinceEpoch
    }); // Tarih değerini millisecondsSinceEpoch ile tamsayıya dönüştürüyoruz
    result.addAll({
      'endDate': endDate.millisecondsSinceEpoch
    }); // Tarih değerini millisecondsSinceEpoch ile tamsayıya dönüştürüyoruz
    result.addAll(
        {'spentTime': spentTime.inMilliseconds}); // Duration değerini inMilliseconds ile tamsayıya dönüştürüyoruz
    result.addAll({
      'estimatedTime': estimatedTime.inMilliseconds
    }); // Duration değerini inMilliseconds ile tamsayıya dönüştürüyoruz
    result.addAll({'category': category});
    result.addAll({'videoCount': videoCount});
    result.addAll({'videoList': videoList.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      teacher: map['teacher'] ?? '',
      progress: map['progress']?.toInt() ?? 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(
          map['startDate']), // millisecondsSinceEpoch ile tamsayıdan DateTime'e dönüştürüyoruz
      endDate: DateTime.fromMillisecondsSinceEpoch(
          map['endDate']), // millisecondsSinceEpoch ile tamsayıdan DateTime'e dönüştürüyoruz
      spentTime: Duration(milliseconds: map['spentTime']), // Duration'u inMilliseconds ile tamsayıdan oluşturuyoruz
      estimatedTime:
          Duration(milliseconds: map['estimatedTime']), // Duration'u inMilliseconds ile tamsayıdan oluşturuyoruz
      category: map['category'] ?? '',
      videoCount: map['videoCount']?.toInt() ?? 0,
      videoList: List<Video>.from(map['videoList']?.map((x) => Video.fromMap(x))),
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
      'duration': duration.inMilliseconds, // Duration'u inMilliseconds ile tamsayıya dönüştürüyoruz
      'status': status,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] ?? 0,
      videoTitle: map['videoTitle'] ?? '',
      link: map['link'] ?? '',
      duration: Duration(milliseconds: map['duration'] ?? 0), // Duration'u inMilliseconds ile tamsayıdan oluşturuyoruz
      status: map['status'] ?? '',
    );
  }
}
