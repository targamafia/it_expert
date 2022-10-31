import '../../utils/result.dart';

class AssessmentRemoteDataSourceInterface {
  Future<Result> fetchFeaturedAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> fetchAssessment(String id) async {
    throw UnimplementedError();
  }

  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> fetchAssessmentGrade(String assessmentId) async {
    throw UnimplementedError();
  }
}
