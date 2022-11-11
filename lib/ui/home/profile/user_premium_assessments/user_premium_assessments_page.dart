import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/utils/status.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/user_premium_assessments_controller.dart';
import 'package:it_expert/ui/style.dart';



class PremiumAssessmentsPage extends StatelessWidget {
  const PremiumAssessmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPremiumAssessmentsController controller = Get.put(UserPremiumAssessmentsController());
    controller.fetchHistory();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: Theme.of(context).primaryColor),
          backgroundColor: Theme.of(context).canvasColor,
        ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
              () => Stack(
            children: [
              if (controller.status.value == Status.SUCCESS)
                Column(
                  children: [
                    Text(
                      "Tus exámenes premium",
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
                                        Text("Examen Premium"),
                                        Spacer(),
                                        Text(e.attempts.toString())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(e.title),
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
      )
    );
  }
}

String asSimpleDateFormat(DateTime dateTime) {
  String dateSlug =
      "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return dateSlug;
}
