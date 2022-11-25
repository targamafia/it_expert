import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/style.dart';

import '../../../core/assessment/application/usecase/get_best_assessments_usecase.dart';
import '../../../core/assessment/application/usecase/get_featured_assessment_usecase.dart';
import '../../../core/assessment/di.dart';
import '../../../core/utils/status.dart';

class MainController extends GetxController {
  final GetBestAssessmentsUseCase _getTopRatedAssessmentsUseCase =
      constructGetBestAssessmentsUseCase();
  final GetFeaturedAssessmentsUseCase _getFeaturedAssessmentsUseCase =
      constructGetFeaturedAssessmentsUseCase();

  List<AssessmentDto> topRated = [];
  List<AssessmentDto> featured = [];
  List<LinearGradient> topRatedGradients = [];
  List<LinearGradient> featuredGradients = [];

  var errorMessage = "";
  var status = Status.NOT_STARTED.obs;

  load() async {
    status(Status.LOADING);
    try {
      await _loadTopRatedAssessments();
      await _loadFeaturedAssessments();

      for (var _ in topRated) {
        topRatedGradients.add(AppColor.randomLinearGradient());
      }

      for (var _ in featured) {
        featuredGradients.add(AppColor.randomLinearGradient());
      }
      status(Status.SUCCESS);
    } catch (e) {
      errorMessage = "Woooops";
      status(Status.ERROR);
    }
  }

  _loadTopRatedAssessments() async {
    var result = await _getTopRatedAssessmentsUseCase.call();
    if (result.isSuccess) {
      topRated = result.getOrNull();
    } else {
      throw result.exceptionOrNull()!;
    }
  }

  _loadFeaturedAssessments() async {
    var result = await _getFeaturedAssessmentsUseCase.call();
    if (result.isSuccess) {
      featured = result.getOrNull();
    } else {
      throw result.exceptionOrNull()!;
    }
  }
}
