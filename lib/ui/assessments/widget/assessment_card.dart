import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/core/utils/extensions.dart';
import 'package:it_expert/ui/assessments/assessment_application/assessment_application_page.dart';

import '../../style.dart';

class AssessmentCard extends StatefulWidget {
  const AssessmentCard({super.key, required this.gradedAssessmentDto});
  final GradedAssessmentDto gradedAssessmentDto;

  @override
  State<AssessmentCard> createState() => _AssessmentCardState();
}

class _AssessmentCardState extends State<AssessmentCard> {
  @override
  Widget build(BuildContext context) {
    var labelTextStyle = Theme.of(context).textTheme.labelMedium;

    return Card(
      elevation: 1,
      child: Container(
        height: 85,
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                "https://images.unsplash.com/photo-1667935764607-73fca1a86555?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80",
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Certificación Cisco 20"),
                  Text(
                    "17 Preguntas",
                    style: labelTextStyle,
                  ),
                  Spacer(),
                  Text("100/100", style: labelTextStyle),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: IconButton(
                  onPressed: () {
                    Get.to(
                      () => AssessmentApplicationPage(
                        assessmentId: widget.gradedAssessmentDto.id,
                      ),
                    );
                  },
                  icon: Icon(Icons.replay)),
            )
          ],
        ),
      ),
    );
  }
}
