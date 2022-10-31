import 'package:it_expert/core/assessment/domain/assessment_repository_interface.dart';

import '../../../utils/result.dart';

class GetAssessmentQuestionsUseCase {
  final AssessmentRepositoryInterface assessmentRepository;

  GetAssessmentQuestionsUseCase(this.assessmentRepository);

  Future<Result> call(String id) {
    return assessmentRepository.getAssessment(id);
  }
}
