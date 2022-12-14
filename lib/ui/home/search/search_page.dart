import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/utils/status.dart';
import 'package:it_expert/ui/home/search/search_page_controller.dart';
import 'package:it_expert/ui/style.dart';

import '../../../core/assessment/domain/dto/assessment_dto.dart';
import '../../assessments/assessment_detail/assessment_detail_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchPageController controller = Get.put(SearchPageController());
    controller.fetchAssessments();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                onChanged: (text) {
                  controller.filtered(text);
                  controller.filter();
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Buscar',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      controller.filter();
                    },
                  ),
                ),
              ),
            ),
            if (controller.status.value == Status.LOADING) Text("Loading..."),
            if (controller.status.value == Status.SUCCESS)
              GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (1 / .4),
                children: controller.filteredAssessments
                    .map((e) => CategoryCard(
                        category: e.title,
                        onPressed: () {
                          print("AssessmentId : ${e.id}");
                          Get.to(
                            () => AssessmentDetailPage(
                              assessmentDto: AssessmentDto(
                                questions: [],
                                categories: [],
                                id: e.id,
                                description: e.description,
                                isPremium: e.isPremium,
                                isPrivate: e.isPrivate,
                                rating: e.rating,
                                title: e.title,
                                thumbnailUrl: e.thumbnailUrl,
                              ),
                            ),
                          );
                        }))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard(
      {Key? key, required this.category, required this.onPressed})
      : super(key: key);
  final String category;
  final void Function() onPressed;

  @override
  State<StatefulWidget> createState() => _CategoryCard();
}

class _CategoryCard extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: AppColor.materialBlue[500],
        ),
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.category,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
