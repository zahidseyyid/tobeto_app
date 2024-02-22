import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/education_model.dart';

class EducationListTile extends StatelessWidget {
  const EducationListTile({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    // TODO: Text ve iconlar constant olmalı
    Icon icon;
    Color iconColor;

    // Video durumuna göre ikon ve rengini belirle
    if (video.status == "Completed") {
      icon = const Icon(Icons.check_circle);
      iconColor = Colors.green;
    } else if (video.status == "In Progress") {
      icon = const Icon(Icons.access_time_filled_sharp);
      iconColor = Colors.yellow.shade700;
    } else {
      icon = const Icon(Icons.play_arrow); // Video başlamadı veya yarım kaldı
      iconColor = Colors.grey; // Kırmızı renkte hata ikonu
    }

    return ListTile(
      title: Text(video.videoTitle),
      subtitle: Text("${video.duration.inMinutes} dk"),
      trailing: icon,
      iconColor: iconColor,
    );
  }
}
