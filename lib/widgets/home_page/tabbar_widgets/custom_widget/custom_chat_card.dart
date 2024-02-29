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
              color:
                  name == "TobetoAI" ? Colors.purpleAccent : Colors.deepPurple,
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
                        Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.background)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background),
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
