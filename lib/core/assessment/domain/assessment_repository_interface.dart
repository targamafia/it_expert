import '../../utils/result.dart';

class AssessmentRepositoryInterface {
  Future<Result> getFeaturedAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> getBestAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> getAllAssessments() async {
    throw UnimplementedError();
  }

  Future<Result> getAssessment(String id) async {
    throw UnimplementedError();
  }

  Future<Result> gradeAssessment(
      Map<String, String> questionsAnswer, String assessmentId) {
    throw UnimplementedError();
  }

  Future<Result> getIsAvailableInfo(String assessmentId) async {
    throw UnimplementedError();
  }

  Future<Result> getAssessmentGrade(String assessmentId) {
    throw UnimplementedError();
  }

  Future<Result> getAllGradedAssessments(String userId) {
    throw UnimplementedError();
  }

  Future<Result> getUserPremiumAssessments(String userId) {
    throw UnimplementedError();
  }

  Future<Result> getAssessmentAttempts(String assessmentId) {
    throw UnimplementedError();
  }

  Future<Result> getAssessmentGradeWithAnswersByGradeId(String gradeId) {
    throw UnimplementedError();
  }
}
