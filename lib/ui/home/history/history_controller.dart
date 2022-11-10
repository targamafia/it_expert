import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:it_expert/core/assessment/application/usecase/get_all_graded_assessments_usecase.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/core/user/application/usecase/get_user_info_local_usecase.dart';
import 'package:it_expert/core/user/di.dart';
import 'package:it_expert/core/utils/status.dart';

import '../../../core/assessment/di.dart';

class HistoryController extends GetxController {
  final GetAllGradedAssessmentsUseCase _getAllGradedAssessmentsUseCase =
      constructGetAllGradedAssessmentsUseCase();

  var status = Status.NOT_STARTED.obs;
  List<GradedAssessmentDto> assessments = [];

  void fetchHistory() async {
    status(Status.LOADING);
    var result = await _getAllGradedAssessmentsUseCase.call();
    if (result.isSuccess) {
      assessments = result.getOrNull() as List<GradedAssessmentDto>;
      status(Status.SUCCESS);
    }
  }
}
