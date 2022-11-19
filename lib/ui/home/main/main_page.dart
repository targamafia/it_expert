import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_page.dart';
import 'package:it_expert/ui/home/main/widget/top_rated_assessment_card_widget.dart';
import 'package:it_expert/ui/home/widget/best_assessment_card_widget.dart';
import 'package:it_expert/ui/home/widget/featured_assessment_card_widget.dart';
import 'package:it_expert/ui/style.dart';

import '../../../core/utils/status.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    controller.load();
    return Obx(
      () => Stack(
        children: [
          if (controller.status.value == Status.LOADING)
            const Center(
              child: Text("Loading"),
            ),
          if (controller.status.value == Status.ERROR)
            const Center(
              child: Text("Error"),
            ),
          if (controller.status.value == Status.SUCCESS)
            const MainPageSuccess(),
        ],
      ),
    );
  }
}

class MainPageSuccess extends StatelessWidget {
  const MainPageSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    print(controller.topRated);
    print(controller.featured);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MRP Capacitaciones",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Mejores exámenes",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (controller.topRated.isNotEmpty)
            CarouselSlider.builder(
              itemCount: controller.topRated.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return AssessmentCardWidget(
                  assessmentDto: controller.topRated[itemIndex],
                  width: context.width,
                  height: context.width,
                  linearGradient: controller.topRatedGradients[itemIndex],
                );
              },
              options:
                  CarouselOptions(viewportFraction: 1, height: context.width),
            ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Exámenes populares",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (controller.featured.isNotEmpty)
            CarouselSlider.builder(
              itemCount: controller.featured.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return AssessmentCardWidget(
                  assessmentDto: controller.featured[itemIndex],
                  width: context.width,
                  height: context.width,
                  linearGradient: controller.featuredGradients[itemIndex],
                );
              },
              options: CarouselOptions(),
            ),
        ],
      ),
    );
  }
}

String getIsPremiumLabel(bool isPremium) {
  if (isPremium) return "PREMIUM";
  return "GRATIS";
}
