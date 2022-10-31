import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/assessments/assessment_application/widget/answer_card_widget.dart';
import 'package:it_expert/ui/style.dart';
import '../../../core/utils/status.dart';
import '../assessment_result/assessment_result_page.dart';
import 'assessment_application_controller.dart';
import 'dart:io' show Platform;

const String LETTERS = "abcdefghijklmnopqrstuvwxyz";

class AssessmentApplicationPage extends StatefulWidget {
  final String assessmentId;

  const AssessmentApplicationPage({Key? key, required this.assessmentId})
      : super(key: key);

  @override
  State<AssessmentApplicationPage> createState() =>
      _AssessmentApplicationPageState();
}

class _AssessmentApplicationPageState extends State<AssessmentApplicationPage> {
  AssessmentApplicationController controller =
      Get.put(AssessmentApplicationController());
  int letterIndex = 0;

  @override
  Widget build(BuildContext context) {
    controller.fetchQuestions("633354f47334cae6e2ad775c");
    return Scaffold(
      backgroundColor: AppColor.aliceBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(
              () => Stack(
                children: [
                  if (controller.status.value == Status.NOT_STARTED)
                    Text("NotStarted..."),
                  if (controller.status.value == Status.LOADING)
                    const Center(
                      child: Text("Loading..."),
                    ),
                  if (controller.status.value == Status.SUCCESS)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.currentQuestion.value.text,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.normal)),
                        Column(
                          children: controller.currentQuestion.value.answers
                              .map((e) => AnswerCardWidget(
                                    id: e.id,
                                    answer: e.text,
                                    isSelected:
                                        controller.selectedAnswerId.value ==
                                            e.id,
                                    onSelect: () {
                                      controller.selectedAnswerId(e.id);
                                    },
                                    letter: nextLetter(),
                                  ))
                              .toList(),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        child: Obx(
          () => Stack(
            children: [
              if (controller.status.value == Status.LOADING)
                Container(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  height: 90.0,
                ),
              if (controller.status.value == Status.SUCCESS)
                Container(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  height: 90.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Examen CISCO II',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Obx(() => Text(
                              '${controller.questionIndex.value + 1} de ${controller.totalQuestions}'))
                        ],
                      ),
                      Obx(() => _renderContinueOrFinishBtn(
                          controller.totalQuestions.value, context)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _renderContinueOrFinishBtn(int numberOfQuestions, BuildContext context) {
    var nextIndex = controller.questionIndex.value + 1;
    if (nextIndex > numberOfQuestions - 1) {
      return ElevatedButton(
        onPressed: () async {
          if (controller.selectedAnswerId.isEmpty) {
            _showSelectAnswerDialog(context);
          } else {
            double grade = await controller.gradeAssessment();
            Get.offAll(AssessmentResultPage(grade: grade));
          }
        },
        child: Row(
          children: const [
            Text('Terminar'),
            Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
            )
          ],
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          if (controller.selectedAnswerId.isEmpty) {
            _showSelectAnswerDialog(context);
          } else {
            controller.nextQuestion();
          }
        },
        child: Row(
          children: const [
            Text('Siguiente'),
            Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
            )
          ],
        ),
      );
    }
  }

  nextLetter() {
    var letter =
        LETTERS[letterIndex % controller.currentQuestion.value.answers.length];
    ++letterIndex;
    return letter;
  }

  void _showSelectAnswerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("Selecciona una respuesta"),
                  content: const Text(
                      "Para continuar a la siguiente pregunta, selecciona una respuesta"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )
              : const AlertDialog(
                  title: Text("Success"),
                  content: Text("Saved successfully"),
                );
        });
  }
}
