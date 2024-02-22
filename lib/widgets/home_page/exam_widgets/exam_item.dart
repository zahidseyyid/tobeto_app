import 'package:flutter/material.dart';

class ExamItem extends StatelessWidget {
  //TODO: Text ve iconlar constant olmalı
  final String quizTitle;
  final String description;
  final String time;
  final VoidCallback? onTap;

  const ExamItem(
      {Key? key,
      required this.quizTitle,
      required this.description,
      required this.time,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 190,
        height: 220,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Card(
              // Card'ın arka plan rengi burada belirlenir
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quizTitle,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 6, right: 6, bottom: 18),
                          child: Text(description),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.timer_outlined,
                                color: Colors.purple,
                              ),
                            ),
                            Text(time,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(0.50),
                          child:
                              Icon(Icons.check, color: Colors.white, size: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
