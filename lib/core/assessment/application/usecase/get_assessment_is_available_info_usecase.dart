import '../../../utils/result.dart';
import '../../domain/assessment_repository_interface.dart';

class GetAssessmentAvailableInfoUseCase {
  final AssessmentRepositoryInterface _assessmentRepository;

  GetAssessmentAvailableInfoUseCase(this._assessmentRepository);

  Future<Result> call(String assessmentId) {
    return _assessmentRepository.getIsAvailableInfo(assessmentId);
  }
}