import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/utils/status.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/user_premium_assessments_controller.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/widget/premium_assessment_card.dart';
import 'package:it_expert/ui/style.dart';

class PremiumAssessmentsPage extends StatelessWidget {
  const PremiumAssessmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPremiumAssessmentsController controller =
        Get.put(UserPremiumAssessmentsController());
    controller.fetchHistory();

    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.all(16),
          child: Obx(
                () => Stack(
              children: [
                if (controller.status.value == Status.SUCCESS)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios_sharp)),
                          Text(
                            "Exámenes premium",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: controller.assessments
                            .map(
                              (e) => PremiumAssessmentCard(assessmentDto: e),
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
                    child: Text(
                        "Lo sentimos, no tienes exámenes premium disponibles."),
                  ),
              ],
            ),
          ),
        ),),),);
  }
}

String asSimpleDateFormat(DateTime dateTime) {
  String dateSlug =
      "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return dateSlug;
}
