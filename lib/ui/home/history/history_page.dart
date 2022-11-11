import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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
                children: [
                  Text(
                    "Historial",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: controller.assessments
                        .map(
                          (e) => Card(
                              elevation: 3,
                              child: Container(
                                color: AppColor.aliceBlue,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Examen"),
                                          Spacer(),
                                          Text(asSimpleDateFormat(e.startDate))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Calificación: "),
                                          Text("${e.grade * 100}")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        )
                        .toList(),
                  ),
                ],
              ),
            if (controller.status.value == Status.LOADING)
              const Center(
                child: Text("Cargando..."),
              ),
            if (controller.status.value == Status.NOT_AVAILABLE)
              const Center(
                child: Text("Lo sentimos, no tienes exámenes premium disponibles."),
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
