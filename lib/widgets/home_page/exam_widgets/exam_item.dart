import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';

class ExamItem extends StatelessWidget {
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
      padding: paddingAllBig,
      child: SizedBox(
        width: 190,
        height: 250,
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
                padding: paddingAllSmall,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: paddingAllSmall,
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
                          padding: paddingHSmall + paddingOnlyBottomBig,
                          child: Text(description),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: paddingAllSmall,
                              child: Icon(
                                CatalogConstants.accessTime,
                                color: Theme.of(context).colorScheme.secondary,
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
                        child: ExamConstants.checkIcon,
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
