import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';

import '../../../utils/result.dart';

class GetFeaturedAssessmentsUseCase {
  final AssessmentRepositoryInterface assessmentRepositoryInterface;

  GetFeaturedAssessmentsUseCase(this.assessmentRepositoryInterface);

  Future<Result> call() {
    return assessmentRepositoryInterface.getFeaturedAssessments();
  }
}
