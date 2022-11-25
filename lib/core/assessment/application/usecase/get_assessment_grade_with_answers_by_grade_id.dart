import '../../../utils/result.dart';
import '../../domain/assessment_repository_interface.dart';

class GetAssessmentGradeWithAnswersByGradeId {
  final AssessmentRepositoryInterface _assessmentRepository;

  GetAssessmentGradeWithAnswersByGradeId(this._assessmentRepository);

  Future<Result> call(String gradeId) {
    return _assessmentRepository
        .getAssessmentGradeWithAnswersByGradeId(gradeId);
  }
}
