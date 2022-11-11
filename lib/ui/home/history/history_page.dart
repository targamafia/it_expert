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
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => Stack(
                children: [
                  if (controller.status.value == Status.SUCCESS)
                    Column(
                      children: [
                        Column(
                          children: controller.assessments
                              .map(
                                (e) => Card(
                                    elevation: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Examen"),
                                                Spacer(),
                                                Text(asSimpleDateFormat(
                                                    e.startDate))
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
                      child: Text("Loading..."),
                    ),
                ],
              ),
            ),
          ),
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
