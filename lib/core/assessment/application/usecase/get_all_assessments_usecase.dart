import '../../../utils/result.dart';
import '../../domain/assessment_repository_interface.dart';

class GetAllAssessmentsUseCase {
  final AssessmentRepositoryInterface _assessmentRepository;

  GetAllAssessmentsUseCase(this._assessmentRepository);

  Future<Result> call() {
    return _assessmentRepository.getAllAssessments();
  }
}
