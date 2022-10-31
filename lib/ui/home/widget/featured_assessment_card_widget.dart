import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style.dart';

class FeaturedAssessmentCardWidget extends StatefulWidget {
  final String label;
  final String id;
  final String title;
  final String area;
  final String thumbnailUrl;
  final List<String> categories;

  final void Function() onPressed;

  const FeaturedAssessmentCardWidget(
      {super.key,
      required this.id,
      required this.title,
      required this.area,
      required this.thumbnailUrl,
      required this.onPressed,
      required this.label,
      required this.categories});

  @override
  State<StatefulWidget> createState() => _FeaturedAssessmentCardWidget();
}

class _FeaturedAssessmentCardWidget
    extends State<FeaturedAssessmentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => widget.onPressed(),
        child: Stack(
          children: [
            Image.network(
              widget.thumbnailUrl,
              // SET A UNIMAGINABLE WIDTH AND HEIGHT TO COVER ENTIRE CARD
              width: 1000,
              height: 1000,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  const Spacer(),
                  Wrap(
                    children: widget.categories
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
