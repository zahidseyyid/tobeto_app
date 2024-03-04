import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/evaluation_page/evaluation_exam_widget.dart';
import 'package:flutter_application_1/widgets/home_page/exam_widgets/exam_dialog.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/gradientcard_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    void onClick(String category) {
      Navigator.pushReplacementNamed(context, "/exam", arguments: category);
    }

    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: paddingOnlyTopSuperBig,
              child: Column(
                children: [
                  Padding(
                    padding: paddingAllMedium,
                    child: Text(
                      EvaluationConstants.pageTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GradientCardWidget(
                  title: EvaluationConstants.successModelText,
                  subtitle: EvaluationConstants.successModelSubtitle,
                  //TODO:temaya başlayınca bu renkleri de ekle
                  startColor: const Color(0xFFe3a6fe),
                  endColor: const Color(0xFF3c0b8c),
                  onPressed: () {},
                  includeStartButton: true,
                ),
                Padding(padding: paddingMedium),
                const GradientCardWidget(
                  title: EvaluationConstants.successTestTitle,
                  subtitle: EvaluationConstants.successTestSubtitle,
                  startColor: Color(0xFFbda6fe),
                  endColor: Color(0xFF1d0b8c),
                ),
                Padding(padding: paddingMedium),
                EvaluationExamWidget(
                  buttonText: EvaluationConstants.dialogTitleFrontEnd,
                  onPressed: () {
                    examDialogWidget(
                        context,
                        EvaluationConstants.dialogTitleFrontEnd,
                        ExamConstants.title,
                        true,
                        30,
                        25,
                        EvaluationConstants.start,
                        () => onClick(EvaluationConstants.dialogTitleFrontEnd));
                  },
                ),
                EvaluationExamWidget(
                  buttonText: EvaluationConstants.dialogTitleFullStack,
                  onPressed: () {
                    examDialogWidget(
                        context,
                        EvaluationConstants.dialogTitleFullStack,
                        ExamConstants.title,
                        true,
                        30,
                        25,
                        EvaluationConstants.start,
                        () =>
                            onClick(EvaluationConstants.dialogTitleFullStack));
                  },
                ),
                EvaluationExamWidget(
                  buttonText: EvaluationConstants.dialogTitleBackEnd,
                  onPressed: () {},
                ),
                EvaluationExamWidget(
                  buttonText: EvaluationConstants.dialogTitleMSQLServer,
                  onPressed: () {},
                ),
                EvaluationExamWidget(
                  buttonText:
                      EvaluationConstants.dialogTitleMasaustuProgramlama,
                  onPressed: () {},
                ),
                SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: paddingAllBig,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                      EvaluationConstants.subscriptionExclusive,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)),
                                  Text(
                                    EvaluationConstants.evaluation,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Text(
                                EvaluationConstants.forTools,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const GradientCardWidget(
                  title: EvaluationConstants.pageTitle2,
                  subtitle: EvaluationConstants.subtitle,
                  startColor: Color(0xFFad1deb),
                  endColor: Color(0xFF6e72fc),
                ),
                Padding(padding: paddingMedium),
                const GradientCardWidget(
                  title: EvaluationConstants.huawieTitle,
                  subtitle: EvaluationConstants.huawieSubtitle,
                  subtitle2: EvaluationConstants.huawieSubtitle2,
                  startColor: Color(0xFFad1deb),
                  endColor: Color(0xFF6e72fc),
                ),
                const FooterWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
