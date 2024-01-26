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
    required this.videoCount,
    required this.videoList,
  });
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
}
