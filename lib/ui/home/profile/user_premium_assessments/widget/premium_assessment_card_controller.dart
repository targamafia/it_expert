import 'package:get/get.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_usecase.dart';
import 'package:it_expert/core/assessment/di.dart';

import '../../../../../core/utils/result.dart';
import '../../../../../core/utils/status.dart';

class PremiumAssessmentCardController extends GetxController {
  var getAssessmentStatus = Status.NOT_STARTED.obs;
  final GetAssessmentUseCase _getAssessmentUseCase = constructGetAssessmentUseCase();

  Future<Result> getAssessment(String id) async {
    getAssessmentStatus(Status.LOADING);
    var result = await _getAssessmentUseCase.call(id);
    if (result.isSuccess) {
      getAssessmentStatus(Status.SUCCESS);
      return result;
    } else {
      getAssessmentStatus(Status.ERROR);
      return result;
    }

  }

}