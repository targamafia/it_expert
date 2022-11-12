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
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .9,
          maxHeight: 85,
        ),
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                widget.gradedAssessmentDto.thumbnailUrl,
                width: 70,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.gradedAssessmentDto.startDate.asSimpleDateFormat(),
                      style: labelTextStyle,
                    ),
                    Text(
                      widget.gradedAssessmentDto.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Text("${(widget.gradedAssessmentDto.grade * 100).round()}%",
                        style: labelTextStyle?.copyWith(
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            ),
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
