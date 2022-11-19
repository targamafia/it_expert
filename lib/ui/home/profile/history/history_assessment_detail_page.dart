import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/ui/home/profile/history/history_assessment_detail_controller.dart';
import 'package:it_expert/ui/style.dart';
import '../../../../core/utils/status.dart';

class HistoryAssessmentDetailPage extends StatefulWidget {
  const HistoryAssessmentDetailPage(
      {Key? key, required this.gradeId, required this.gradedAssessmentDto})
      : super(key: key);
  final String gradeId;
  final GradedAssessmentDto gradedAssessmentDto;

  @override
  State<HistoryAssessmentDetailPage> createState() =>
      _HistoryAssessmentDetailPageState();
}

class _HistoryAssessmentDetailPageState
    extends State<HistoryAssessmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    HistoryAssessmentDetailController controller =
        Get.put(HistoryAssessmentDetailController());
    controller.load(widget.gradeId);
    controller.gradedAssessmentDto = widget.gradedAssessmentDto;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(controller.gradedAssessmentDto.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Stack(
              children: [
                if (controller.status.value == Status.SUCCESS)
                  const HistoryAssessmentDetailPageSuccess(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryAssessmentDetailPageSuccess extends StatelessWidget {
  const HistoryAssessmentDetailPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HistoryAssessmentDetailController controller = Get.find();
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
                  child: Column(
                    children: [
                      Text("calificación"),
                      Text(
                        "${(controller.gradedAssessmentDto.grade * 100).round()}/100",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColor.correctGreen),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
                  child: Column(
                    children: [
                      Text("Preguntas \ncorrectas"),
                      Text(
                        controller.gradedAssessmentDto.correctAnswers
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColor.correctGreen),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
                  child: Column(
                    children: [
                      Text("Incorrectas"),
                      Text(
                        controller.gradedAssessmentDto.wrongAnswers.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColor.incorrectRed),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Preguntas",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Column(
            children: controller.gradeAssessmentResponseDto.questions
                .map(
                  (e) => Card(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.getIndexAndIncrement()}. ${e.questionTitle}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (e.isCorrect)
                            Text(
                              "Correcta",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColor.correctGreen),
                            ),
                          if (!e.isCorrect)
                            Text(
                              "Incorrecta",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColor.incorrectRed),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
