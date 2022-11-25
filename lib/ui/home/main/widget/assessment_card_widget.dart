import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_page.dart';
import 'package:it_expert/ui/style.dart';

class AssessmentCardWidget extends StatefulWidget {
  const AssessmentCardWidget(
      {Key? key,
      required this.assessmentDto,
      required this.width,
      required this.height,
      required this.linearGradient})
      : super(key: key);
  final AssessmentDto assessmentDto;
  final double width;
  final double height;
  final LinearGradient linearGradient;

  @override
  State<AssessmentCardWidget> createState() => _AssessmentCardWidgetState();
}

class _AssessmentCardWidgetState extends State<AssessmentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AssessmentDetailPage(assessmentDto: widget.assessmentDto));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: widget.linearGradient,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.assessmentDto.isPremium) const PremiumTagWidget(),
              if (!widget.assessmentDto.isPremium) const FreeTagWidget(),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.assessmentDto.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              const Spacer(),
              DisplayHorizontalTags(tags: widget.assessmentDto.categories),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumTagWidget extends StatelessWidget {
  const PremiumTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.amberAccent),
      child: Text(
        "Premium",
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}

class FreeTagWidget extends StatelessWidget {
  const FreeTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: AppColor.bluetiful),
      child: Text(
        "Gratis",
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}

class DisplayHorizontalTags extends StatefulWidget {
  const DisplayHorizontalTags({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  State<DisplayHorizontalTags> createState() => _DisplayHorizontalTagsState();
}

class _DisplayHorizontalTagsState extends State<DisplayHorizontalTags> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Wrap(
        children: widget.tags
            .getRange(
              0,
              min(widget.tags.length,
                  4), // TODO: Prevent overflow on a lot of tags
            )
            .map<Card>(
              (it) => Card(
                color: AppColor.randomLabelColor(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "#$it",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
