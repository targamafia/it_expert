import '../../../utils/result.dart';
import '../../domain/assessment_repository_interface.dart';

class GetAssessmentGradeUseCase {
  final AssessmentRepositoryInterface _assessmentRepository;

  GetAssessmentGradeUseCase(this._assessmentRepository);

  Future<Result> call(String assessmentId) {
    return _assessmentRepository.getAssessmentGrade(assessmentId);
  }
}
