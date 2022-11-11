import '../../../utils/result.dart';
import '../../domain/assessment_repository_interface.dart';

class GetBestAssessmentsUseCase {
  final AssessmentRepositoryInterface _assessmentRepositoryInterface;

  GetBestAssessmentsUseCase(this._assessmentRepositoryInterface);

  Future<Result> call() async {
    return _assessmentRepositoryInterface.getBestAssessments();
  }
}
