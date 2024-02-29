import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';

import '../../../../constants/page_constants.dart';

class ChatCard extends StatelessWidget {
  final String name;
  final String message;
  const ChatCard({
    super.key,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          name == "TobetoAI" ? Alignment.centerLeft : Alignment.centerRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: paddingAllMedium,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                            image: NetworkImage(
                                CustomCircleAvatarConstants.defaultPhotoUrl),
                            width: 30,
                            height: 30),
                        Text(name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
