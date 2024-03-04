import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/models/education_model.dart';

class EducationListTile extends StatelessWidget {
  const EducationListTile({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    Color iconColor;

    // Video durumuna göre ikon ve rengini belirle
    if (video.status == EducationListTileConstants.completed) {
      icon = EducationListTileConstants.checkCircleIcon;
      iconColor = Colors.green;
    } else if (video.status == EducationListTileConstants.inProgress) {
      icon = EducationListTileConstants.accessTimeFilledIcon;
      iconColor = Colors.yellow.shade700;
    } else {
      icon = EducationListTileConstants
          .playArrowIcon; // Video başlamadı veya yarım kaldı
      iconColor = Colors.grey; // Kırmızı renkte hata ikonu
    }

    return ListTile(
      title: Text(video.videoTitle),
      subtitle: Text(
          "${video.duration.inMinutes} ${EducationListTileConstants.duration}"),
      trailing: icon,
      iconColor: iconColor,
    );
  }
}
