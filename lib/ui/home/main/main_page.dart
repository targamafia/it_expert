import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_page.dart';
import 'package:it_expert/ui/home/widget/best_assessment_card_widget.dart';
import 'package:it_expert/ui/home/widget/featured_assessment_card_widget.dart';
import 'package:it_expert/ui/style.dart';

import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    controller.loadFeaturedAssessments();
    controller.loadBestAssessments();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lo mejor",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Obx(() {
            if (controller.bestAssessments.isNotEmpty) {
              return CarouselSlider.builder(
                itemCount: controller.bestAssessments.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  var it = controller.bestAssessments[itemIndex];
                  return FeaturedAssessmentCardWidget(
                    id: it.id,
                    title: it.title,
                    area: it.description,
                    thumbnailUrl: it.thumbnailUrl,
                    onPressed: () {
                      Get.to(
                        () => AssessmentDetailPage(
                          assessmentDto: AssessmentDto(
                            questions: [],
                            title: it.title,
                            description: it.description,
                            categories: it.categories,
                            id: it.id,
                            isPremium: true,
                            isPrivate: true,
                            rating: 5,
                            thumbnailUrl:
                                'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
                          ),
                        ),
                      );
                    },
                    categories: it.categories,
                    label: 'GRATIS',
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .40,
                  viewportFraction: .90,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
              );
            } else {
              return Container(height: 400);
            }
          }),
          const SizedBox(height: 12),
          Text(
            "Exámenes Populares",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Obx(() {
            if (controller.featuredAssessments.isNotEmpty) {
              return CarouselSlider.builder(
                itemCount: controller.featuredAssessments.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  var it = controller.featuredAssessments[itemIndex];
                  return FeaturedAssessmentCardWidget(
                    id: it.id,
                    title: it.title,
                    area: it.description,
                    thumbnailUrl: it.thumbnailUrl,
                    onPressed: () {
                      Get.to(
                        () => AssessmentDetailPage(
                          assessmentDto: AssessmentDto(
                            questions: [],
                            title: it.title,
                            description: it.description,
                            categories: it.categories,
                            id: it.id,
                            isPremium: true,
                            isPrivate: true,
                            rating: 5,
                            thumbnailUrl:
                                'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
                          ),
                        ),
                      );
                    },
                    categories: it.categories,
                    label: 'GRATIS',
                  );
                },
                options: CarouselOptions(
                    initialPage: 1,
                    viewportFraction: .8,
                    enableInfiniteScroll: true),
              );
            } else {
              return Container(height: 200);
            }
          }),
        ],
      ),
    );
  }
}
