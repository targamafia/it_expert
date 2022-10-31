import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';

import '../../../utils/result.dart';

class GradeAssessmentUseCase {
  final AssessmentRepositoryInterface _assessmentRepositoryInterface;
  GradeAssessmentUseCase(this._assessmentRepositoryInterface);

  Future<Result> call(
      Map<String, String> questionsAnswer, String assessmentId) {
    return _assessmentRepositoryInterface.gradeAssessment(
        questionsAnswer, assessmentId);
  }
}
