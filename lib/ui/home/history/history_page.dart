import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/assessments/widget/assessment_card.dart';
import 'package:it_expert/ui/home/history/history_controller.dart';
import 'package:it_expert/ui/style.dart';

import '../../../core/utils/status.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    controller.fetchHistory();
    return Padding(
      padding: EdgeInsets.all(16),
      child: Obx(
        () => Stack(
          children: [
            if (controller.status.value == Status.SUCCESS)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Historial",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: controller.assessments
                        .map(
                          (e) => AssessmentCard(gradedAssessmentDto: e),
                        )
                        .toList(),
                  ),
                ],
              ),
            if (controller.status.value == Status.LOADING)
              const Center(
                child: Text("Loading..."),
              ),
          ],
        ),
      ),
    );
  }
}

String asSimpleDateFormat(DateTime dateTime) {
  String dateSlug =
      "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return dateSlug;
}
