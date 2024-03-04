import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/models/exam_model.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/widgets/evaluation_page/answer_card.dart';
import 'package:flutter_application_1/widgets/evaluation_page/timer_widget.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exam_result_dialog.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key, required this.category});
  final String category;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int wrongAnswer = 0;
  int emptyAnswer = 0;
  int point = 0;
  //TODO:son sorunun boş olma durumuna tekrar bir bak.

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<ExamModel> questions =
        exam.where((question) => question.category == widget.category).toList();

    void pickAnswer(int value) {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
        point += 20;
      } else if (selectedAnswerIndex != question.correctAnswerIndex) {
        wrongAnswer++;
      } else {
        emptyAnswer++;
      }
      setState(() {});
    }

    void goToNextQuestion() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        if (selectedAnswerIndex == null) {
          emptyAnswer++;
        }
        selectedAnswerIndex = null;
      }
      setState(() {});
    }

    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(questions[questionIndex].category),
      ),
      body: Padding(
        padding: paddingAllSuperBig,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TimerWidget(),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: paddingAllBig,
                child: Text(
                  question.question,
                  style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            // Next Button
            isLastQuestion
                ? CustomButton(
                    onPressed: () {
                      examResultDialogWidget(
                        context,
                        score,
                        wrongAnswer,
                        emptyAnswer,
                        point,
                        () {
                          Navigator.of(context).pop();
                          //Navigator.pushNamed(context, '/evoluation');
                        },
                      );
                    },
                    buttonText: ExamConstants.examFinish,
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    buttonTextColor: Theme.of(context).colorScheme.background,
                    width: screenWidth / 2,
                  )
                : CustomButton(
                    onPressed: goToNextQuestion,
                    buttonText: ExamConstants.nextQuestion,
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    buttonTextColor: Theme.of(context).colorScheme.background,
                    width: screenWidth / 2,
                  ),
          ],
        ),
      ),
    );
  }
}
