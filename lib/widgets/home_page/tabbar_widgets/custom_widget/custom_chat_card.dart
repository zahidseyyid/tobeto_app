import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';

class ChatCard extends StatelessWidget {
  final String name;
  final String message;
  final String photo;
  const ChatCard({
    super.key,
    required this.name,
    required this.message,
    required this.photo,
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
              color: name == "TobetoAI"
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.secondary,
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
                        CircleAvatar(
                          backgroundImage: NetworkImage(photo),
                          radius: 20,
                        ),
                        Padding(padding: paddingHSmall),
                        Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: name == "TobetoAI"
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .background)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message,
                        style: TextStyle(
                            color: name == "TobetoAI"
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.background),
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
