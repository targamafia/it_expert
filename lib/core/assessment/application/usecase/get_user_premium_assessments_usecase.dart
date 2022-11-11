import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';

import '../../../utils/result.dart';

class PremiumAssessmentsUseCase {
  final AssessmentRepositoryInterface _assessmentRepository;
  PremiumAssessmentsUseCase(this._assessmentRepository);

  Future<Result> call(String userId) {
    return _assessmentRepository.getUserPremiumAssessments(userId);
  }
}