import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(16.0),
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
                    icon: const Icon(Icons.close),
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
