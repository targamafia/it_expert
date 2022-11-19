import 'package:get/get.dart';
import 'package:it_expert/core/assessment/application/usecase/get_assessment_grade_with_answers_by_grade_id.dart';
import 'package:it_expert/core/assessment/di.dart';
import 'package:it_expert/core/assessment/domain/dto/grade_assessment_response_dto.dart';
import 'package:it_expert/core/assessment/domain/dto/graded_assessment_dto.dart';

import '../../../../core/utils/status.dart';

class HistoryAssessmentDetailController extends GetxController {
  final GetAssessmentGradeWithAnswersByGradeId
      _getAssessmentGradeWithAnswersByGradeId =
      constructGetAssessmentGradeWithAnswersByGradeId();

  var status = Status.NOT_STARTED.obs;
  late GradeAssessmentResponseDto gradeAssessmentResponseDto;
  late GradedAssessmentDto gradedAssessmentDto;
  int _index = 1;

  int getIndexAndIncrement() {
    int tmp = _index;
    _index += 1;
    return tmp;
  }

  load(String gradeId) async {
    status(Status.LOADING);
    var result = await _getAssessmentGradeWithAnswersByGradeId.call(gradeId);
    if (result.isSuccess) {
      print("HistoryAssessmentDetailPage: ${result.getOrNull()}");
      gradeAssessmentResponseDto = result.getOrNull();
      status(Status.SUCCESS);
    } else {
      status(Status.ERROR);
    }
  }
}
