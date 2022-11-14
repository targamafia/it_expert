import '../../utils/result.dart';

class AssessmentRemoteDataSourceInterface {
  Future<Result> fetchFeaturedAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> fetchBestAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> fetchAssessment(String id) async {
    throw UnimplementedError();
  }

  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> fetchAllGradedAssessments(String userId) async {
    throw UnimplementedError();
  }

  Future<Result> fetchAssessmentGrade(String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> isAvailable(String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> fetchAssessmentAttemps(String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> fetchAllAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> fetchUserPremiumAssessments(String userId) {
    throw UnimplementedError();
  }
}
