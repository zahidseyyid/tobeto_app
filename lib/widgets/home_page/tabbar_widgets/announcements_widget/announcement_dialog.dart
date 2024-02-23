import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';

void announcementDialogWidget(
  BuildContext context,
  String dialogTitle,
  String dialogText,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenSize.width,
          height: screenSize.height, // Ekranın genişliği kadar
          padding: paddingAllBig,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      dialogTitle,
                      softWrap: true,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: LessonConstants.closeIcon,
                    onPressed: () {
                      Navigator.of(context).pop(); // Popup'ı kapat
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(dialogText),
            ],
          ),
        ),
      );
    },
  );
}
