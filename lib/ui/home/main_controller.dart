import 'package:get/get.dart';
import '../../core/assessment/application/usecase/get_best_assessments_usecase.dart';
import '../../core/assessment/application/usecase/get_featured_assessment_usecase.dart';
import '../../core/assessment/di.dart';

class MainController extends GetxController {
  GetBestAssessmentsUseCase getBestAssessmentsUseCase =
      constructGetBestAssessmentsUseCase();
  GetFeaturedAssessmentsUseCase getFeaturedAssessmentsUseCase =
      constructGetFeaturedAssessmentsUseCase();

  RxList bestAssessments = [].obs;
  RxList featuredAssessments = [].obs;
  var errorMessage = "".obs;

  loadBestAssessments() async {
    var result = await getBestAssessmentsUseCase.call();
    if (result.isSuccess) {
      bestAssessments(result.getOrNull());
    } else {
      var error = result.exceptionOrNull() as Exception;
      errorMessage(error.toString());
    }
  }

  loadFeaturedAssessments() async {
    var result = await getFeaturedAssessmentsUseCase.call();
    if (result.isSuccess) {
      featuredAssessments(result.getOrNull());
    } else {
      var error = result.exceptionOrNull() as Exception;
      errorMessage(error.toString());
    }
  }
}
