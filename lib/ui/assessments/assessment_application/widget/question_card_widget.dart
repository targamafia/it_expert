import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/question_dto.dart';
import 'package:it_expert/ui/assessments/assessment_application/widget/answer_card_widget.dart';
import 'package:it_expert/ui/assessments/assessment_application/widget/question_card_widget_controller.dart';

String LETTERS = "abcdefghijklmnopqrstuvwxyz";

class QuestionCardWidget extends StatefulWidget {
  final QuestionDto questionDto;

  const QuestionCardWidget({Key? key, required this.questionDto})
      : super(key: key);

  @override
  State<QuestionCardWidget> createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  int letterIndex = 0;
  QuestionCardWidgetController controller =
      Get.put(QuestionCardWidgetController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.questionDto.text,
              style: Theme.of(context).textTheme.headline6,
            ),
            Column(
                children: widget.questionDto.answers
                    .map(
                      (e) => Obx(
                        () => AnswerCardWidget(
                          isSelected: controller.selectedAnswerId.value == e.id,
                          onSelect: () {
                            controller.selectedAnswerId(e.id);
                          },
                          letter: nextLetter(),
                          id: e.id,
                          answer: e.text,
                        ),
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
    );
  }

  nextLetter() {
    var letter = LETTERS[letterIndex % widget.questionDto.answers.length];
    ++letterIndex;
    return letter;
  }
}
