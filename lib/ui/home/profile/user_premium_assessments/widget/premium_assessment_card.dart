import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_page.dart';
import 'package:it_expert/ui/home/main/widget/assessment_card_widget.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/widget/premium_assessment_card_controller.dart';

import '../../../../assessments/assessment_application/assessment_application_page.dart';

class PremiumAssessmentCard extends StatefulWidget {
  const PremiumAssessmentCard({Key? key, required this.assessmentDto})
      : super(key: key);
  final AssessmentDto assessmentDto;

  @override
  State<PremiumAssessmentCard> createState() => _PremiumAssessmentCardState();
}

class _PremiumAssessmentCardState extends State<PremiumAssessmentCard> {
  @override
  Widget build(BuildContext context) {
    var labelTextStyle = Theme.of(context).textTheme.labelMedium;
    PremiumAssessmentCardController controller =
        Get.put(PremiumAssessmentCardController());
    return InkWell(
      onTap: () async {
        Get.to(() => AssessmentDetailPage(assessmentDto: widget.assessmentDto));
      },
      child: Card(
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
                  widget.assessmentDto.thumbnailUrl,
                  width: 70,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.assessmentDto.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      const PremiumTagWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
