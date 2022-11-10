import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import '../../style.dart';

class BestAssessmentCardWidget extends StatefulWidget {
  final Color backgroundColor;
  final AssessmentDto assessmentDto;
  final void Function() onPressed;

  const BestAssessmentCardWidget(
      {super.key,
      required this.assessmentDto,
      required this.backgroundColor,
      required this.onPressed});

  @override
  State<StatefulWidget> createState() => _BestAssessmentCardWidget();
}

class _BestAssessmentCardWidget extends State<BestAssessmentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          FittedBox(
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                width: 2000,
                height: 2000,
                widget.assessmentDto.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () => widget.onPressed(),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              //height: 300,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.assessmentDto.isPremium ? "PREMIUM" : "GRATIS",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 250,
                      child: Text(
                        widget.assessmentDto.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    const Spacer(),
                    Wrap(
                      children: widget.assessmentDto.categories
                          .map<Card>(
                            (it) => Card(
                              color: AppColor.randomLabelColor(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                  "#$it",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
