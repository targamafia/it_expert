import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_grade_usecase.dart';
import 'package:it_expert/core/assessment/di.dart';

class AssessmentResultController extends GetxController {
  var score = 0.obs;
  final GetAssessmentGradeUseCase _getAssessmentGradeUseCase =
      constructGetAssessmentGradeUseCase();
  void fetchGrade(String assessmentId) async {
    var result = await _getAssessmentGradeUseCase.call(assessmentId);
    if (result.isSuccess) {
      print("AssessmentResult: ${result.getOrNull()}");
      score(result.getOrNull());
    }
  }
}
