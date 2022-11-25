import 'package:it_expert/core/utils/result.dart';

import '../../domain/assessment_repository_interface.dart';

class GetAssessmentAttemptsUsecase {
  final AssessmentRepositoryInterface _assessmentRepository;

  GetAssessmentAttemptsUsecase(this._assessmentRepository);

  Future<Result> call(String assessmentId) {
    return _assessmentRepository.getAssessmentAttempts(assessmentId);
  }
}
