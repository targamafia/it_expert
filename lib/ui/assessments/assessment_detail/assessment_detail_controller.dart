import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_attempts_usecase.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/grade_report_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';
import 'package:it_expert/core/utils/status.dart';

import '../../../core/assessment/di.dart';

class AssessmentDetailController extends GetxController {
  final GetAssessmentAttemptsUsecase _getAssessmentAttemptsUsecase =
      constructGetAssessmentAttemptsUsecase();

  late GradeReportDto gradeReportDto;
  var status = Status.ERROR.obs;
  late AssessmentDto assessmentDto;

  void fetchAssessmentAttemps(String assessmentId) async {
    status(Status.LOADING);
    var result = await _getAssessmentAttemptsUsecase.call(assessmentId);
    if (result.isSuccess) {
      gradeReportDto = result.getOrNull() as GradeReportDto;
      status(Status.SUCCESS);
    }
  }
}
